import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/background.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
          child: Center(
            child: Text(
              'ADICIONAR CARROS',
              style: GoogleFonts.oswald(
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 246, 241, 241),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const Stack(
        children: [
          BackgroundColor(),
          Text('OI'),
        ],
      ),
    );
  }
}
