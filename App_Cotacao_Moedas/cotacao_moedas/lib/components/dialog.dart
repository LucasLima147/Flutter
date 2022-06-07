import 'package:flutter/material.dart';

AlertDialog dialog(String title, String description, BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, 'OK'),
        child: const Text('OK'),
      ),
    ],
  );
}
