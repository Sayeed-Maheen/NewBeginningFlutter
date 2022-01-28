import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_beginning/pages/homePage.dart';
import 'package:new_beginning/util/customWidgets.dart';
import 'package:new_beginning/util/routes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 150),
              child: Container(
                padding: EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello there!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff21243D)),
                    ),
                    SizedBox(height: 10.0),
                    Image(image: AssetImage("assets/images/design.png")),
                    SizedBox(height: 60.0),
                    Text(
                      "Sign up here",
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
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Color(0xff21243D),
                          ),
                          hintText: "User name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Color(0xff21243D),
                          ),
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff21243D),
                          ),
                          hintText: "Password",
                          suffixIcon: Icon(Icons.visibility_off),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color(0xffCBCBCB),
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff21243D),
                          ),
                          hintText: "Password",
                          suffixIcon: Icon(Icons.visibility_off),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        height: 50.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xff21243D),
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xFF21243D), fontSize: 15.0),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xffFE6565),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
