// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_final/controller/signup_controllers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SignUpDealerships());
}

class SignUpDealershipController extends StatelessWidget {
  const SignUpDealershipController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormProvider(),
      child: Scaffold(
        body: SignUpDealerships(),
      ),
    );
  }
}

class SignUpDealerships extends StatelessWidget {
  SignUpDealerships({super.key});

  final TextEditingController _controllerAutonomyLevel =
      TextEditingController(text: 'Iniciante');
  final _dealershipState = FormProvider();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
            child: Center(
              child: Text(
                'CADASTRO DE LOJAS',
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 48, 182, 219),
                Color.fromARGB(255, 40, 127, 159),
                Color.fromARGB(255, 11, 119, 173),
                Color.fromARGB(255, 3, 78, 124),
              ],
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
                              'CNPJ',
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
                          controller: _dealershipState.controllerCnpj,
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
                              return 'Por favor, informe um CNPJ válido.';
                            } else if (value.length < 14 || value.length > 14) {
                              return 'cnpj deve conter 14 digitos';
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
                              'NOME DA LOJA',
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
                          controller: _dealershipState.controllerDealershipName,
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
                            } else if (value.length > 120) {
                              return 'Nome deve ter menos de 120 caracteres';
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
                              'NIVEL DE AUTONOMIA',
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
                        child: DropdownButtonFormField<String>(
                          value: _controllerAutonomyLevel.text,
                          items: <String>[
                            'Iniciante',
                            'Intermediário',
                            'Avançado',
                            'Personalizado',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            _controllerAutonomyLevel.text = newValue!;
                          },
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
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            _dealershipState.password =
                                FormProvider().gerarSenha();
                            _dealershipState.controllerPassword.text =
                                _dealershipState.password;
                          },
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 20, 108, 148)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 20, 108, 148)),
                                ),
                              )),
                          child: Text('GERAR SENHA',
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  letterSpacing: 4,
                                  color: const Color.fromARGB(
                                      255, 246, 241, 241))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                        child: TextFormField(
                          controller: _dealershipState.controllerPassword,
                          showCursor: false,
                          readOnly: true,
                          cursorColor: const Color.fromARGB(255, 246, 241, 241),
                          decoration: InputDecoration(
                            labelText: _dealershipState.password,
                            labelStyle: GoogleFonts.oswald(
                              fontSize: 18,
                              letterSpacing: 2,
                              color: const Color.fromARGB(255, 246, 241, 241),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 246, 241, 241)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 246, 241, 241)),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
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
                                    color: Colors.grey.shade400,
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
                                      await _dealershipState.insert();
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromARGB(
                                                  255, 20, 108, 148)),
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
      ),
    );
  }
}
