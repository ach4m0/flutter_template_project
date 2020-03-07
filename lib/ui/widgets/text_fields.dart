import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextField(
    {
      Key key,
      this.labelText,
      this.obscureText = false,
      this.controller, this.keyboardType
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: _getBorder(context),
        focusedBorder: _getBorder(context),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  OutlineInputBorder _getBorder(BuildContext context) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        width: 2
      )
    );

}
