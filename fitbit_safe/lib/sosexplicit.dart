import 'package:fitbit_safe/Sosimplicit.dart';
import 'package:fitbit_safe/Stop.dart';
import 'package:fitbit_safe/profile.dart';
import 'package:flutter/material.dart';

class Sosexplicit extends StatefulWidget {
  @override
  _SosexplicitState createState() => _SosexplicitState();
}

class _SosexplicitState extends State<Sosexplicit> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.person),color: Colors.white,onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Profile()));
        },),
        backgroundColor: Color(0xffD02850),
        title: Padding(padding:EdgeInsets.symmetric(horizontal: w*(0.03)),child: Text("Emergency!",style: TextStyle(color: Colors.white,fontSize: 25),)),

      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
         Center(
           child: Container(
             width: w*0.7,
              child: GestureDetector(
                child: Image.asset("image/pinksos.png"),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => Sosimplicit()));
                },
              ),
            ),
         ),
          SizedBox(height: h/5,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "On pressing the SOS button \n or on detecting an accidental event \n live coordinates will be sent \n to your emergency contacts",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffD02850),fontSize: 17,fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
