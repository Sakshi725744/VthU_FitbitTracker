import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbit_safe/Sosimplicit.dart';
import 'package:fitbit_safe/fitbit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vibration/vibration.dart';
import 'package:sms_maintained/sms.dart';

class Stop extends StatefulWidget {
  @override
  _StopState createState() => _StopState();
}

class _StopState extends State<Stop> {
  void _sendSMS(List<String> phonenum,String name,Position p){
    try {
      SmsSender sender = new SmsSender();
     sender.sendSms(new SmsMessage(phone1, name+" is experiencing shock! find her at the given coordinates "+p.toString()));
      sender.sendSms(new SmsMessage(phone2, name+" is experiencing shock! find her at the given coordinates "+p.toString()));

    } catch (error) {
      print(error.toString());
    }
  }

  Future<Position> currentLocation() async {
    return Geolocator.getCurrentPosition();
  }

  Future<bool> getNumber() async {
    var response = await FirebaseFirestore.instance
        .collection("fitbit")
        .doc("heart")
        .get();
    return response["hike"];
  }

  Stream<bool> getNumbers(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getNumber();
    }
  }
  String name = "Unknown";
  String phone1 = "+916354373919";
  String phone2 = "+916354373919";
  Future<dynamic> getData() async {
    final DocumentReference document = FirebaseFirestore.instance
        .collection("fitbit")
        .doc("profile");

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        name = snapshot['name'];
        phone1 = snapshot['phone1'];
        phone2 = snapshot['phone2'];
      });
    });
  }
@override
  void initState() {
  super.initState();
  getData();
  Future.delayed(Duration(minutes: 1),() async{
    var pos= await currentLocation();
    _sendSMS([phone1,phone2],name, pos);
  });


  }

  @override
  void dispose() {
    super.dispose();
    Vibration.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
        stream: getNumbers(Duration(seconds: 2)),
        initialData: false,
        builder: (context, stream) {
          if (stream.hasData) {
            if (stream.data == true) {
              Vibration.vibrate(amplitude: 5);
              return Center(
                child: FutureBuilder<Position>(
                  future: currentLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      FirebaseFirestore.instance
                          .collection("fitbit")
                          .doc("location")
                          .set({
                        "current": new GeoPoint(
                            snapshot.data.latitude, snapshot.data.longitude)
                      });
                      return Sosimplicit();

                    }
                    else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
              );
            } else {
              return fitbit();
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
