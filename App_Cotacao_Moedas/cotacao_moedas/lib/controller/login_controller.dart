class LoginController {
  final String userEmail = "admin";
  final String userPassword = "1478";

  static final LoginController instance = LoginController();

  bool login(String email, String password) {
    if (email == userEmail && password == userPassword) {
      return true;
    }
    return false;
  }

  // void login2(String email, String password, BuildContext context) {
  //   if (email == "teste@email.com" && password == '123') {
  //     print("Login Válido!");
  //     Navigator.of(context).pushReplacementNamed('/currency');
  //   } else {
  //     print("Login inválido");
  //   }
  // }
}
