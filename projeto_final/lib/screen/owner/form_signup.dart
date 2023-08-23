import 'package:flutter/material.dart';

void main() {
  runApp(const SignUpDealerships());
}

class SignUpDealerships extends StatefulWidget {
  const SignUpDealerships({super.key});

  @override
  State<SignUpDealerships> createState() => _SignUpDealershipsState();
}

class _SignUpDealershipsState extends State<SignUpDealerships> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('formulário'),
    );
  }
}
