import 'dart:io';

import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/cars.dart';
import '../../controller/theme_controller.dart';
import '../utilities/background.dart';

class CarScreenController extends StatelessWidget {
  const CarScreenController({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => CarsProvider(),
    child: Scaffold(
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
      body: Stack(
        children: [
          const BackgroundColor(),
          CarScreen(),
        ],
      ),
    ),
    );
  }
}

class CarScreen extends StatelessWidget {
   CarScreen({super.key});

   final _formKey = GlobalKey<FormState>();
  @override
 Widget build(BuildContext context) {
 final state = Provider.of<CarsProvider>(context, listen: true); 
 final colorState = Provider.of<ThemeProvider>(context);
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
                  const Row(
                    children: [
                      Padding(
                              padding: EdgeInsets.only(
                                top: 56,
                                left: 48,
                                right: 48,
                                bottom: 8,
                              ),
                              child: _BrandTextField(),
                            ),
                    ],
                  ),
                 const Padding(
                              padding: EdgeInsets.only(
                                top: 56,
                                left: 48,
                                right: 48,
                                bottom: 8,
                              ),
                              child: _ModelTextField(),
                            ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 0, 100, 0),
                        child: Text(
                          'PLACA DO CARRO',
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
                      controller: state.controllerPlate,
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
                        if(value == null){
                          return 'digite uma placa';
                        }
                        else{
                        if (value.length != 7) {
                          return 'placa inválida.';
                        } else {
                          return null;
                        }}
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 0, 100, 0),
                        child: Text(
                          'ANO DO CARRO',
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
                      controller: state.controllerCarYear,
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
                          return 'ano inválido.';
                        } else if (value.length  != 4) {
                          return 'ano deve ter 4 caracteres';
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
                          'PREÇO DO CARRO',
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
                      controller: state.controllerBuyPrice,
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
                        }
                          else{
                        return null;}
                      },
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, top: 35, bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {
                              await state.pickImage();
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
                            child: state.controllerPhoto != null
                                ? Image.file(
                                    File(state.controllerPhoto!),
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  )
                                : Center(
                                    child: Text(
                                      'adicione uma imagem',
                                      style: GoogleFonts.oswald(
                                        fontSize: 20,
                                        letterSpacing: 3,
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
                                  await state.insert();
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


class _BrandTextField extends StatelessWidget {
  const _BrandTextField();

  String? validator(String? value) {
    if (value!.isEmpty) {
      return "Please inform the vehicle's brand";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CarsProvider>(context, listen: true);
    return AppTextFieldAutoComplete(
      controller: state.controllerBrand,
      validator: validator,
      suggestions: state.allBrands,
    );
  }
}

class _ModelTextField extends StatelessWidget {
  const _ModelTextField();

  String? validator(String? value) {
    if (value!.isEmpty) {
      return "Please inform the vehicle's model";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CarsProvider>(context, listen: true);
    return AppTextFieldAutoComplete(
      controller: state.controllerModel,
      validator: validator,
      focusNode: state.modelFieldFocusNode,
      suggestions: state.allModels,
    );
  }
}


class AppTextFieldAutoComplete extends StatelessWidget {
  const AppTextFieldAutoComplete({
    required this.suggestions,
    required this.controller,
    this.validator,
    this.focusNode,
    super.key,
  });

  final List<String> suggestions;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return EasyAutocomplete(
      suggestions: suggestions,
      validator: validator,
      focusNode: focusNode,
      onChanged: (value) => controller,
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
