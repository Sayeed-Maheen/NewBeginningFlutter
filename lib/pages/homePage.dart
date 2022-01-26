import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Beginning"),
      ),
      body: Center(
        child: Text("Hey There!"),
      ),
    );
  }
}
