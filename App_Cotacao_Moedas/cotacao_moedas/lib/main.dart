import 'package:cotacao_moedas/views/corrency_page.dart';
import 'package:cotacao_moedas/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/currency': (context) => CurrencyPage(),
      },
    );
  }
}
