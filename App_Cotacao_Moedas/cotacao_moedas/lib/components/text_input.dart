import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;

  const FormTextField(
      {Key? key, @required this.labelText, @required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: null,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
