import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_beginning/pages/homePage.dart';
import 'package:new_beginning/pages/infoForm.dart';
import 'package:new_beginning/pages/logInPage.dart';
import 'package:new_beginning/pages/signUpPage.dart';
import 'package:new_beginning/pages/splashScreen.dart';
import 'package:new_beginning/util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        primarySwatch: createMaterialColor(Color(0xFF21243D)),
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signupRoute: (context) => SignUpPage(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.infoRoute: (context) => InfoForm(),
      },
    );
  }
}

// Primary Swatch custom widget//
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
