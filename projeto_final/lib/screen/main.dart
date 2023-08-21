import 'package:flutter/material.dart';
import 'package:projeto_final/model/db_class.dart';
import 'package:projeto_final/screen/user/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DbClass(),
      child: const MaterialApp(
        title: 'Projeto Final',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
