import 'package:flutter/material.dart';

class NavBarCustom extends StatelessWidget {
  final Widget body;
  final Widget drawer;
  final String title;

  const NavBarCustom({
    Key? key,
    required this.body,
    required this.drawer,
    this.title = 'Meu App',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 69, 155),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: drawer,
      body: body,
    );
  }
}
