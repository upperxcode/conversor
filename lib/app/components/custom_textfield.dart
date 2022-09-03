import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String caption;
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.caption, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.right,
      decoration: InputDecoration(

        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
      ),
    );
  }
}
