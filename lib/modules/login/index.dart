import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 20, 69, 155),
            Color.fromARGB(255, 59, 130, 252),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          _buildBodyBack(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/pmrr.gif',
                          width: 100, // opcional
                          height: 100, // opcional
                          fit: BoxFit.contain, // opcional
                        ),

                        SizedBox(height: 20),

                        Text(
                          'SICC',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'Sistema de Indentificação e Classificação Criminal',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 40),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Bem vindo(a) ao SICC. Faça login com seus dados.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: _cpfController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'CPF',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: _passWordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed('/home');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: Size(400, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
