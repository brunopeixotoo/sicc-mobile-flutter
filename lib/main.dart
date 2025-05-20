import 'package:flutter/material.dart';
import 'package:sicc/core/routes/homes_screen.dart';
import 'package:sicc/modules/login/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}