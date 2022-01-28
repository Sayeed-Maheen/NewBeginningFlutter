import 'package:flutter/material.dart';

//  Check Box   //
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CustomCheckBox> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      activeColor: Color(0xFF21243D),
      onChanged: (bool) {
        setState(() {
          _value = bool!;
        });
      },
    );
  }
}
