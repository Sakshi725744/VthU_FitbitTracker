import 'package:fitbit_safe/Stop.dart';
import 'package:fitbit_safe/sosexplicit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class fitbit extends StatefulWidget {
  @override
  _fitbitState createState() => _fitbitState();
}

class _fitbitState extends State<fitbit> {
  List<String> getDateNTime() {
    var datenow = DateTime.now();
    var date=datenow.year.toString()+"-"+datenow.month.toString()+"-"+datenow.day.toString();
    var h = datenow.hour;
    var m = datenow.minute;
    var hs = datenow.hour.toString();
    var ms = datenow.minute.toString();
    if (h - 10 < 0) hs = "0" + hs;
    if (m - 10 < 0) ms = "0" + ms;
    var time2 = hs + ":" + ms;
    if (m == 0) {
      m = 59;
      h = h - 1;
    }
    if (m == 0 && h == 0) {
      m = 59;
      h = 23;
    }
    hs = h.toString();
    ms = (m - 1).toString();
    if (h - 10 < 0) hs = "0" + hs;
    if (m - 10 < 0) ms = "0" + ms;
    var time1 = hs + ":" + ms;
    return [time1, time2,date];
  }

  Future<bool> getNumber() async {
    var time = getDateNTime();
    var response = await http.get(
        "https://api.fitbit.com/1/user/-/activities/heart/date/"+time[2]+"/1d/1sec/time/" +
            time[0] +
            "/" +
            time[1] +
            ".json",
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMkJZMkoiLCJzdWIiOiI3M0RaU0IiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJhY3QgcnNldCBybG9jIHJ3ZWkgcmhyIHJudXQgcnBybyByc2xlIiwiZXhwIjoxNjA3ODY3OTA4LCJpYXQiOjE2MDc4MzkxMDh9.rQ48_sgEUizdzLjZcynzo-VJVuitvYGpqtNXFUV6u4U"
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var js = jsonResponse["activities-heart-intraday"]["dataset"];
      int initial = js[0]["value"];
      int fin = js[js.length - 1]["value"];
      print(fin-initial);
      if (fin - initial >= 20)
        return true;
      else
        return false;
    } else {
      return false;
    }
  }

  Stream<bool> getNumbers(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getNumber();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: getNumbers(Duration(seconds: 30)),
        initialData: false,
        builder: (context, stream) {
          if (stream.hasData) {
            print(stream.data);
            if (stream.data) {
              FirebaseFirestore.instance
                  .collection("fitbit")
                  .doc("heart")
                  .set({"hike": true});
              return Stop();
            } else {
              return Sosexplicit();
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
