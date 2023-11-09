import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/theme_controller.dart';
import 'screen/utilities/background.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width / 10
            ),
          child: Center(
            child: Text(
              'CONFIGURAÇÕES',
              style: GoogleFonts.oswald(
                fontSize: 20,
                letterSpacing: 3,
                color: const Color.fromARGB(255, 246, 241, 241),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                      size: MediaQuery.sizeOf(context).height / 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
