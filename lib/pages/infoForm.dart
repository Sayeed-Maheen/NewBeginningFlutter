import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_beginning/pages/homePage.dart';
import 'package:new_beginning/util/appColors.dart';
// import 'package:new_beginning/util/customWidgets.dart';
// import 'package:new_beginning/util/routes.dart';

class InfoForm extends StatefulWidget {
  const InfoForm({Key? key}) : super(key: key);

  @override
  State<InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  List<String> gender = ["Male", "Female", "Other"];
  Future<void> _selectDataFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null)
      setState(() {
        _birthdayController.text =
            "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("infoForm-data");
    return _collectionRef
        .doc(currentUser!.email)
        .set({
          "name": _usernameController.text,
          "number": _mobilenumberController.text,
          "date of birth": _birthdayController.text,
          "age": _ageController.text,
          "gender": _genderController.text,
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomePage())))
        .catchError((error) => print("something is wrong.$error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 180),
              child: Container(
                padding: EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal information",
                      style: TextStyle(fontSize: 28, color: Color(0xff21243D)),
                    )
                  ],
                ),
              ),
            ),
            //SizedBox(height: -50),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "User name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: _mobilenumberController,
                        decoration: InputDecoration(
                          hintText: "Mobile number",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: _birthdayController,
                        decoration: InputDecoration(
                          hintText: "Date of birth",
                          suffixIcon: IconButton(
                            padding: EdgeInsets.only(right: 10.0),
                            onPressed: () => _selectDataFromPicker(context),
                            icon: Icon(
                              Icons.calendar_view_day,
                              color: Color(0xff21243D),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          hintText: "Enter your age",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: _genderController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Choose your gender",
                          prefixIcon: DropdownButton<String>(
                            items: gender.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                                onTap: () {
                                  setState(() {
                                    _genderController.text = value;
                                  });
                                },
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        sendUserDataToDB();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      child: Container(
                        height: 50.0,
                        width: 300.0,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Already have an account?",
            //       style: TextStyle(color: Color(0xFF21243D), fontSize: 15.0),
            //     ),
            //     TextButton(
            //         onPressed: () {
            //           Navigator.pop(context,
            //               MaterialPageRoute(builder: (context) => HomePage()));
            //         },
            //         child: Text(
            //           "Login",
            //           style: TextStyle(
            //               color: Color(0xffFE6565),
            //               fontSize: 15.0,
            //               fontWeight: FontWeight.bold),
            //         ))
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
