import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_beginning/pages/homePage.dart';
import 'package:new_beginning/pages/logInPage.dart';
import 'package:new_beginning/util/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New Beginning",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text("New Beginning"),
      //   // ),

      // ),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
