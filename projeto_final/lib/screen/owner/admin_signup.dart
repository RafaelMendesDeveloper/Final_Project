import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/login_admin.dart';
import '../../controller/theme_controller.dart';
import '../utilities/background.dart';

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
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const BackgroundColor(),
            SignUpAdmin(),
          ],
        ),
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
            child: Center(
              child: Text(
                'CADASTRO DE ADMS',
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
      ),
    );
  }
}

class SignUpAdmin extends StatelessWidget {
  SignUpAdmin({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colorState = Provider.of<ThemeProvider>(context);
    final adminState = Provider.of<AdminProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(56, 56, 104, 0),
                        child: Text(
                          'CPF',
                          style: GoogleFonts.oswald(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: colorState.isLight
                            ? Colors.black
                            : const Color.fromARGB(255, 246, 241, 241),
                      ),
                      controller: adminState.controllerCpf,
                      cursorColor: const Color.fromARGB(255, 246, 241, 241),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 20, 108, 148),
                          ),
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
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                    child: TextFormField(
                      style: TextStyle(
                        color: colorState.isLight
                            ? Colors.black
                            : const Color.fromARGB(255, 246, 241, 241),
                      ),
                      controller: adminState.controllerAdminName,
                      cursorColor: const Color.fromARGB(255, 246, 241, 241),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 20, 108, 148),
                          ),
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
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                    child: TextFormField(
                      style: TextStyle(
                        color: colorState.isLight
                            ? Colors.black
                            : const Color.fromARGB(255, 246, 241, 241),
                      ),
                      controller: adminState.controllerAdminUserName,
                      cursorColor: const Color.fromARGB(255, 246, 241, 241),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 20, 108, 148),
                          ),
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
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                    child: TextFormField(
                      style: TextStyle(
                        color: colorState.isLight
                            ? Colors.black
                            : const Color.fromARGB(255, 246, 241, 241),
                      ),
                      obscureText: true,
                      controller: adminState.controllerPassword,
                      cursorColor: const Color.fromARGB(255, 246, 241, 241),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 246, 241, 241),
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 20, 108, 148),
                          ),
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
                  Container(
                    margin:
                        const EdgeInsets.only(left: 48, top: 32, bottom: 24),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {
                              await adminState.pickImage();
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 20, 108, 148),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 20, 108, 148),
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'ADD IMAGEM',
                              style: GoogleFonts.oswald(
                                fontSize: 20,
                                letterSpacing: 4,
                                color: const Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: adminState.controllerPhoto != null
                                ? 
                                adminState.controllerCpf.text != '' ?
                                Image.file(
                                    File(adminState.controllerPhoto!),
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  )
                                : Center(
                                    child: Text(
                                      'adicione uma imagem',
                                      style: GoogleFonts.oswald(
                                        fontSize: 18,
                                        letterSpacing: 4,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 246, 241, 241),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      'adicione uma imagem',
                                      style: GoogleFonts.oswald(
                                        fontSize: 18,
                                        letterSpacing: 4,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 246, 241, 241),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
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
                                  await adminState.insert();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 20, 108, 148),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 20, 108, 148),
                                    ),
                                  ),
                                ),
                              ),
                              child: Text(
                                'CADASTRAR',
                                style: GoogleFonts.oswald(
                                  fontSize: 35,
                                  letterSpacing: 4,
                                  color:
                                      const Color.fromARGB(255, 246, 241, 241),
                                ),
                              ),
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
    );
  }
}
