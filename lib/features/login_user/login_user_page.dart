import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class LoginUserPage extends StatefulWidget {
  const LoginUserPage({Key? key}) : super(key: key);

  @override
  State<LoginUserPage> createState() => _LoginUserPageState();
}

class _LoginUserPageState extends State<LoginUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String apiUrl = 'https://bis365.com.br/bid365/api/v1/auth/login';
  final String app = '583f0a5b-c017-4956-b788-a6305767c117';

  Future<void> login() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'app': app,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {"username": emailController.text, "password": passwordController.text},
      ),
    );
    if (response.statusCode == 200) {
      Modular.to.navigate('/diaryAuction');
    } else {
      return print("falha login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(38, 38, 41, 1),
              Color.fromRGBO(9, 20, 9, 1),
            ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                      height: 135,
                      width: 124,
                      child: Image.asset("assets/images/logo1.png"))),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Informe os dados para acessar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 295,
                height: 45,
                child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "email@example.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Senha",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 295,
                height: 45,
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: 294,
                  height: 56,
                  child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          primary: const Color.fromRGBO(174, 132, 26, 1)),
                      child: const Text("Entrar"))),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 294,
                  height: 56,
                  child: ElevatedButton(
                      onPressed: () {
                        Modular.to.navigate('/registerUser');
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        primary: Colors.transparent,
                      ),
                      child: const Text("Criar conta"))),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: 114,
                  height: 35,
                  child: Image.asset("assets/images/dixlogo.png"))
            ]),
      ),
    );
  }
}
