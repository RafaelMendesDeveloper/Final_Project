// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/login_admin.dart';
import '../../controller/theme_controller.dart';


void main() {
  runApp(SignUpAdmin());
}

class SignUpAdminController extends StatelessWidget {
  const SignUpAdminController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminProvider(),
      child: Scaffold(
        body: SignUpAdmin(),
      ),
    );
  }
}

class SignUpAdmin extends StatelessWidget {
  SignUpAdmin({super.key});

  final _adminState = AdminProvider();
  final _formKey = GlobalKey<FormState>();

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
          child: Center(
            child: Text(
              'CADASTRO DE ADMS',
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
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Form(
                //login forms
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 40, 100, 0),
                          child: Text(
                            'CPF',
                            style: GoogleFonts.oswald(
                                fontSize: 18,
                                letterSpacing: 2,
                                color:
                                    const Color.fromARGB(255, 246, 241, 241)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                      child: TextFormField(
                        style: TextStyle(
                          color: colorState.isLight? Colors.black : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: _adminState.controllerCpf,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 241, 241)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe um CPF válido.';
                          } else if (value.length < 11 || value.length > 11) {
                            return 'CPF deve conter 11 digitos';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 100, 0),
                          child: Text(
                            'NOME COMPLETO',
                            style: GoogleFonts.oswald(
                                fontSize: 18,
                                letterSpacing: 2,
                                color:
                                    const Color.fromARGB(255, 246, 241, 241)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: TextFormField(
                        style: TextStyle(
                          color: colorState.isLight? Colors.black : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: _adminState.controllerAdminName,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 241, 241)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome inválido.';
                          } else if (value.length > 200) {
                            return 'Nome deve ter menos de 200 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 100, 0),
                          child: Text(
                            'NOME DE USUÁRIO',
                            style: GoogleFonts.oswald(
                                fontSize: 18,
                                letterSpacing: 2,
                                color:
                                    const Color.fromARGB(255, 246, 241, 241)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: TextFormField(
                        style: TextStyle(
                          color: colorState.isLight? Colors.black : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: _adminState.controllerAdminUserName,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 241, 241)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome inválido.';
                          } else if (value.length > 20) {
                            return 'Nome deve ter menos de 20 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 0, 100, 0),
                          child: Text(
                            'SENHA',
                            style: GoogleFonts.oswald(
                                fontSize: 18,
                                letterSpacing: 2,
                                color:
                                    const Color.fromARGB(255, 246, 241, 241)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: TextFormField(
                        style: TextStyle(
                          color: colorState.isLight? Colors.black : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        obscureText: true,
                        controller: _adminState.controllerPassword,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 246, 241, 241)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Senha Inválida.';
                          } else if (value.length > 10) {
                            return 'Nome deve ter menos de 10 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 0, 20),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: colorState.isLight
                              ? Colors.grey.shade400
                              : const Color.fromARGB(255, 17, 34, 63),
                                  spreadRadius: 1,
                                  blurRadius: 100,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              height: 80,
                              width: 300,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _adminState.insert();
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 20, 108, 148)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 20, 108, 148)),
                                      ),
                                    )),
                                child: Text('CADASTRAR',
                                    style: GoogleFonts.oswald(
                                        fontSize: 35,
                                        letterSpacing: 4,
                                        color: const Color.fromARGB(
                                            255, 246, 241, 241))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
