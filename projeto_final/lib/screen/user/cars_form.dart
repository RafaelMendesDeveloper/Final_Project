import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/cars.dart';
import '../../controller/theme_controller.dart';
import '../utilities/background.dart';
import 'auto_complete.dart';

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
    final state = Provider.of<CarsProvider>(context);
    final colorState = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                        padding: const EdgeInsets.fromLTRB(20, 90, 100, 4),
                        child: Text(
                          'MARCA DO CARRO',
                          style: GoogleFonts.oswald(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 55,
                          right: 48,
                        ),
                        child: SizedBox(
                          height: 60.0,
                          width: 280.0,
                          child: _BrandTextField()),
                      ),
                    ],
                  ),
                  Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 100, 0),
                        child: Text(
                          'MODELO DO CARRO',
                          style: GoogleFonts.oswald(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 0,
                      left: 48,
                      right: 48,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 60.0,
                      width: 280.0,
                      child: _ModelTextField(),),
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
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: TextFormField(
                      style: TextStyle(
                        color: colorState.isLight
                            ? Colors.black
                            : const Color.fromARGB(255, 246, 241, 241),
                      ),
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
                          return 'Preço Inválido';
                        }
                          else{
                        return null;}
                      },
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 50, top: 25, bottom: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60,
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
                          height: 60.0,
                          width: 120.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
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
                                        fontSize: 16,
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
                    padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
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
                            height: 70,
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
      return 'informe a marca do veículo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CarsProvider>(context, listen: true);
    return AppTextFieldAutoComplete(
      controller: state.controllerBrand,
      validator: validator,
      focusNode: state.brandFieldFocusNode,
      suggestions: state.allBrands,
    );
  }
}

class _ModelTextField extends StatelessWidget {
  const _ModelTextField();

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'por favor informe o modelo do veículo';
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
