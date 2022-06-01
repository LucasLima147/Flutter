import 'package:flutter/material.dart';

AppBar appBar(String titlePage) {
  return AppBar(
    leading: Icon(Icons.calculate),
    title: Text(titlePage),
    backgroundColor: Colors.lightGreen[900],
  );
}
