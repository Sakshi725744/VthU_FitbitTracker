import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbit_safe/profile.dart';
import 'package:flutter/material.dart';

class Sosimplicit extends StatefulWidget {
  @override
  _SosimplicitState createState() => _SosimplicitState();
}

class _SosimplicitState extends State<Sosimplicit> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.person),color: Colors.white,onPressed: (){Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Profile()));},),
        backgroundColor: Color(0xffD02850),
        title: Padding(padding:EdgeInsets.symmetric(horizontal: w*(0.03)),child: Text("Emergency!",style: TextStyle(color: Colors.white,fontSize: 25),)),
      ),
      backgroundColor:Color(0xffD02850) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: w*0.7,
              child: GestureDetector(
                child: Image.asset("image/whiesos.png"),
                onTap: () {
                  FirebaseFirestore.instance
                      .collection("fitbit")
                      .doc("location").set({
                    "current": new GeoPoint(
                        0, 0)
                  });
                  FirebaseFirestore.instance
                      .collection("fitbit")
                      .doc("heart")
                      .update({"hike": false});
                },
              ),
            ),
          ),
          SizedBox(height: h/5,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Stay alert! \n We have informed the officials",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
