import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_controller.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorState = Provider.of<ThemeProvider>(context);
    final gradientColors = colorState.isLight
        ? [
            const Color.fromARGB(255, 48, 182, 219),
            const Color.fromARGB(255, 40, 127, 159),
            const Color.fromARGB(255, 11, 119, 173),
            const Color.fromARGB(255, 3, 78, 124)
          ]
        : [
            const Color.fromARGB(255, 3, 78, 124),
            const Color.fromARGB(255, 1, 64, 86),
            const Color.fromARGB(255, 3, 53, 79),
            const Color.fromARGB(255, 0, 28, 46)
          ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
          child: Center(
            child: Text(
              'CHECAR INVENTÁRIO',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 246, 241, 241)),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: gradientColors,
          ),
        ),
        child: const Text('OI'),
      ),
    );
  }
}
