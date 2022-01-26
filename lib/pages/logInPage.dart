import 'package:flutter/material.dart';
import 'package:new_beginning/pages/homePage.dart';
import 'package:new_beginning/util/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Text(
                    "Hello there!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Everything you want is here")
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "User Name",
                      labelText: "User name",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18),
                      minimumSize: Size(150, 40),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
