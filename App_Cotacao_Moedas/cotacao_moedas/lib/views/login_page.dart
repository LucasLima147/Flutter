import 'package:cotacao_moedas/components/app_bar.dart';
import 'package:cotacao_moedas/components/dialog.dart';
import 'package:cotacao_moedas/components/text_input.dart';
import 'package:cotacao_moedas/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Login"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login"),
          FormTextField(
            labelText: "campo de email",
            hintText: "nome@email.com",
            obscureText: null,
            textController: emailController,
          ),
          FormTextField(
              labelText: "Password",
              hintText: "*****",
              obscureText: true,
              textController: passwordController),
          ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String pass = passwordController.text;
                print(email + " | " + pass);

                if (email.isEmpty || pass.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog("Campos vazios",
                          "Você não preencheu um dos campos", context));
                  return;
                }

                if (!LoginController.instance.login(email, pass)) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog(
                          "Login inválido",
                          "email ou senha inválido",
                          context));
                  return;
                }

                Navigator.of(context).pushReplacementNamed('/currency');
              },
              child: const Text("Login")),
        ],
      ),
    );
  }
}
