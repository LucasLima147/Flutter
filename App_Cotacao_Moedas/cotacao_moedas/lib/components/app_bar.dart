import 'package:flutter/material.dart';

AppBar appBar(String titlePage) {
  return AppBar(
    leading: Icon(Icons.currency_exchange_rounded),
    title: Text(titlePage),
    backgroundColor: Colors.blueGrey[800],
  );
}
