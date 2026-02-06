import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ), // BoxDecoration
                child: Column(
                  children: [
                    FlutterLogo(size: 76),
                    SizedBox(height: 16),
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(hintText: 'Nome'),
                    ), // TextField
                    SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'E-mail'),
                    ), // TextField
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _senhaController,
                      decoration: InputDecoration(hintText: 'senha'),
                    ), // TextField
                    SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      controller: _confirmaSenhaController,
                      decoration:
                          InputDecoration(hintText: 'Confirme sua senha'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(onPressed: () {}, child: Text('Cadastrar')),
                    SizedBox(height: 16),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
