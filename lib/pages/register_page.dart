import 'package:flutter/material.dart';
import 'package:mensagens/components/my_button.dart';
import 'package:mensagens/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void singUp() {}

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
                    "Criando sua conta",
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
                  const SizedBox(height: 10),
                  MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirmar Senha',
                      obscureText: true),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: singUp,
                    text: "Cadastrar",
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já possui conta? '),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Faça Login!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
