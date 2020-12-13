import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbit_safe/Sosimplicit.dart';
import 'package:fitbit_safe/sosexplicit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffD02850),

        title: Center(child: Text("Profile",style: TextStyle(color: Colors.white),)),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(h*0.08),child: Center(child: Image.asset("image/heading.png")),),
            Container(
              decoration: BoxDecoration(
                color:  Color(0xffD02850),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(width: 3,color: Color(0xffD02850),)
              ),
              child: Column(
                children:[
            Padding(
              padding: EdgeInsets.only(bottom:h*(0.04),top: h*(0.04),left: h*(0.03),right: h*(0.03)),
              child: Column(
                children: [
                  Text("Name",
                      style: GoogleFonts.galdeano(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: h * 0.032,
                              fontWeight: FontWeight.normal)),textAlign: TextAlign.start,),
                  Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(22.0)),
                    ),
                    child: SizedBox(
                      width: w * 0.6,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: name,
                        keyboardType: TextInputType.name,
                        cursorColor: Color(0xffD02850),
                        maxLength: 30,
                        maxLengthEnforced: true,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),

                        style: GoogleFonts.galdeano(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: h*0.032,
                                fontWeight: FontWeight.normal)),
                        //decoration: InputDecoration(hintText: 'Enter phone number'),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:h*(0.04)),
              child: Column(
                children: [
                  Text("Emergency Contact",
                      style: GoogleFonts.galdeano(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: h * 0.032,
                              fontWeight: FontWeight.normal))),
                  Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(22.0)),
                    ),
                    child: SizedBox(
                      width: w * 0.6,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: phone1,
                        keyboardType: TextInputType.name,
                        cursorColor: Color(0xffD02850),
                        maxLength: 10,
                        maxLengthEnforced: true,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.galdeano(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: h*0.032,
                                fontWeight: FontWeight.normal),),
                        //decoration: InputDecoration(hintText: 'Enter phone number'),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:h*(0.04)),
              child: Column(
                children: [
                  Text("Emergency Contact",
                      style: GoogleFonts.galdeano(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: h * 0.032,
                              fontWeight: FontWeight.normal))),
                  Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(22.0)),
                    ),
                    child: SizedBox(
                      width: w * 0.6,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: phone2,
                        keyboardType: TextInputType.name,
                        cursorColor: Color(0xffD02850),
                        maxLength: 10,
                        maxLengthEnforced: true,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counterStyle: TextStyle(
                            height: double.minPositive,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.galdeano(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: h*0.032,
                                fontWeight: FontWeight.normal)),
                        //decoration: InputDecoration(hintText: 'Enter phone number'),

                      ),
                    ),
                  ),
                ],
              ),
            ),
                    ],),
            ),
            Padding(
              padding: EdgeInsets.all(w*(0.1)),
              child: RaisedButton(
                color: Theme.of(context).buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(25.0)),
              ),
                onPressed: (){
                  FirebaseFirestore.instance.collection("fitbit").doc("profile").set({"name": name.text,"phone1": "+91"+phone1.text,"phone2": "+91"+phone2.text});
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => Sosexplicit()));
                },
                child: Padding(
                  padding: EdgeInsets.all(w*(0.03)),
                  child: Text("Submit", style: TextStyle(color: Colors.white,fontSize: 22),),
                )),
            ),

          ],
        ),
      ),
    );
  }
}
