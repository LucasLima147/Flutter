import 'package:cotacao_moedas/components/app_bar.dart';
import 'package:cotacao_moedas/components/text_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Login"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login"),
          FormTextField(
            labelText: "campo de email",
            hintText: "nome@email.com",
          ),
          FormTextField(
            labelText: "campo de senha",
            hintText: "senha123",
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/currency');
            },
            child: Text('Autentification'),
          )
        ],
      ),
    );
  }
}
