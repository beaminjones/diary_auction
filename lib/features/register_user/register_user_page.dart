import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const String apiUrl = 'https://bis365.com.br/bid365/api/v1/auth/users';
  static const String appHeader = '583f0a5b-c017-4956-b788-a6305767c117';

  Future<void> registerUser() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'app': appHeader,
      },
      body: jsonEncode({
        "email": emailController.text,
        "name": nameController.text,
        "phone": phoneController.text,
        "password": passwordController.text
      }),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Seu cadastro foi realizado com sucesso"),
        backgroundColor: Color.fromRGBO(30, 61, 25, 1),
      ));
      clearForm();
    } else {
      print(
          'Erro ao cadastrar usuário. Código de status: ${response.statusCode}');
    }
  }

  void clearForm() {
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      clearForm();
      registerUser();
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Criar Conta"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.navigate('/'),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "Nome completo",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 328,
              height: 50,
              child: TextFormField(
                cursorColor: const Color.fromRGBO(255, 255, 255, 0.9),
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  hintText: "Informe seu Nome completo",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "E-mail",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 328,
              height: 50,
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    hintText: "Informe seu E-mail",
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "Celular",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 328,
              height: 50,
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    hintText: "Informe seu Celular"),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "Senha",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 328,
              height: 50,
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  hintText: "Informe sua Senha",
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            SizedBox(
              width: 333,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    primary: const Color.fromRGBO(0, 136, 0, 1)),
                child: const Text("Criar conta"),
              ),
            ),
          ]),
    );
  }
}
