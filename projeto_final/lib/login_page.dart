import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/login.dart';
import 'controller/theme_controller.dart';

void main() {
  runApp(LoginPage());
}

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formLoginKey = GlobalKey<FormState>();
  final _loginState = LoginProvider();

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
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 72.0, bottom: 26.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 241, 241),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorState.isLight
                              ? Colors.grey.shade400
                              : const Color.fromARGB(255, 17, 34, 63),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Form(
              key: _formLoginKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 50),
                    child: Text(
                      'ANDERCAR',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 20, 108, 148),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 0, 80, 0),
                        child: Text('LOGIN',
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 20, 108, 148))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 25),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(-2, -2),
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: _loginState.loginController,
                        style: GoogleFonts.oswald(
                            fontSize: 22,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 175, 211, 223)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 175, 211, 223),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 20, 100, 0),
                        child: Text('SENHA',
                            style: GoogleFonts.oswald(
                                fontSize: 25,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 20, 108, 148))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _loginState.passwordController,
                        style: GoogleFonts.oswald(
                          fontSize: 22,
                        ),
                        obscureText: true,
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 175, 211, 223)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 175, 211, 223),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: SizedBox(
                      width: 304.0,
                      height: 80.0,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formLoginKey.currentState!.validate()) {
                                final isValid = await _loginState.getDealership(
                                    _loginState.loginController.text,
                                    _loginState.passwordController.text);
                                if (isValid != null &&
                                    isValid.password ==
                                        _loginState.passwordController.text) {
                                  Navigator.pushNamed(context, '/userpage');
                                } else {
                                  return showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('ATENÇÃO!',
                                            style: GoogleFonts.oswald(
                                                fontSize: 25,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                                color: const Color.fromARGB(
                                                    255, 20, 108, 148))),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'Usuário ou Senha incorretos!'
                                                  ,style: GoogleFonts.oswald(
                                                      fontSize: 20,
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              20,
                                                              108,
                                                              148))),
                                              Text('Digite Novamente.',
                                                  style: GoogleFonts.oswald(
                                                      fontSize: 20,
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              20,
                                                              108,
                                                              148))),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Ok!',
                                                style: GoogleFonts.oswald(
                                                    fontSize: 20,
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(
                                                        255, 20, 108, 148))),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 20, 108, 148)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 20, 108, 148)),
                                  ),
                                )),
                            child: Center(
                                child: Text('ENTRAR',
                                    style: GoogleFonts.oswald(
                                        fontSize: 35,
                                        letterSpacing: 4,
                                        color: const Color.fromARGB(
                                            255, 246, 241, 241))))),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Divider(
                      color: Color.fromARGB(55, 20, 108, 148),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ownerlogin');
                      },
                      child: Text('Entrar como Dono',
                          style: GoogleFonts.oswald(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: const Color.fromARGB(255, 20, 108, 148),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}