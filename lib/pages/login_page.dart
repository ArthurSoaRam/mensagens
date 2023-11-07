import 'package:flutter/material.dart';
import 'package:mensagens/components/my_button.dart';
import 'package:mensagens/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void singIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.message_sharp,
                    size: 100,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "App Mensagens",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),
                  const SizedBox(height: 10),
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Senha',
                      obscureText: true),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: singIn,
                    text: "Entrar",
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não possui conta?'),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Cadastre-se!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
