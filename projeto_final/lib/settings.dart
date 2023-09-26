import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeProvider>(context);
    final gradientColors = state.isLight
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
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 35, 0),
          child: Center(
            child: Text(
              'CONFIGURAÇÕES',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: const Color.fromARGB(255, 246, 241, 241)),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              label: state.isLight
                  ? const Text(
                      'MUDAR PARA TEMA ESCURO',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'MUDAR PARA TEMA CLARO',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: state.toggleTheme,
              icon: Icon(
                state.isLight ? Icons.dark_mode : Icons.light_mode,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
