// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/signup_controllers.dart';
import '../../controller/theme_controller.dart';
import '../../entities/dealership.dart';

void main() {
  runApp(SignUpDealerships());
}

class SignUpDealershipController extends StatelessWidget {
  const SignUpDealershipController({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Dealership?;
    return ChangeNotifierProvider(
      create: (context) => DealershipProvider(dealership: args),
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

    final dealershipState = Provider.of<DealershipProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              colors: gradientColors),
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
                        style: TextStyle(
                          color: colorState.isLight
                              ? Colors.black
                              : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: dealershipState.controllerCnpj,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          labelText: dealershipState.dealership?.cnpj,
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 246, 241, 241),
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
                        style: TextStyle(
                          color: colorState.isLight
                              ? Colors.black
                              : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: dealershipState.controllerDealershipName,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          labelText: dealershipState.dealership?.name,
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
                        ].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
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
                          dealershipState.password =
                              dealershipState.gerarSenha();
                          dealershipState.controllerPassword.text =
                              dealershipState.password;
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
                                color:
                                    const Color.fromARGB(255, 246, 241, 241))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                      child: TextFormField(
                        style: TextStyle(
                          color: colorState.isLight
                              ? Colors.black
                              : const Color.fromARGB(255, 246, 241, 241),
                        ),
                        controller: dealershipState.controllerPassword,
                        showCursor: false,
                        readOnly: true,
                        cursorColor: const Color.fromARGB(255, 246, 241, 241),
                        decoration: InputDecoration(
                          labelText: dealershipState.dealership?.password,
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
                    Container(
                      margin:
                          const EdgeInsets.only(left: 50, top: 35, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () async {
                                print('ELE VAI ADICIONAR A IMAGEM');
                                dealershipState.pickImageFromGallery();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 20, 108, 148)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 20, 108, 148)),
                                    ),
                                  )),
                              child: Text('ADD IMAGEM',
                                  style: GoogleFonts.oswald(
                                      fontSize: 20,
                                      letterSpacing: 4,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0),
                             child: dealershipState.selectedImage != null
                                ? Image.file(dealershipState.selectedImage!)
                                : const Text('Por favor'),
                           ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 0, 10),
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
                                  print('------------------');
                                  print(
                                      dealershipState.controllerAutonomyLevel);
                                  print(_controllerAutonomyLevel.text);
                                  if (_formKey.currentState!.validate()) {
                                    final alreadyExists =
                                        dealershipState.getDealership(
                                            dealershipState.dealership?.id);
                                    if (await alreadyExists) {
                                      await dealershipState
                                          .update(dealershipState.dealership);
                                    } else {
                                      await dealershipState.insert();
                                      print(dealershipState
                                          .controllerAutonomyLevel);
                                      print(_controllerAutonomyLevel.text);
                                    }
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
