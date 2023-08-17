import 'package:flutter/material.dart';
import 'package:projeto_final/screen/user/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Projeto Final',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
