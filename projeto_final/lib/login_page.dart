import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/login.dart';
import 'controller/theme_controller.dart';
import 'screen/utilities/background.dart';

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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const BackgroundColor(),
            LoginPage(),
          ],
        ),
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
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(
            left: (MediaQuery.sizeOf(context).width / 24), 
            right: (MediaQuery.sizeOf(context).width / 24), 
            top: (MediaQuery.sizeOf(context).height / 8), 
            bottom: (MediaQuery.sizeOf(context).height / 11)),
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
                padding: EdgeInsets.only(
                  top: (MediaQuery.sizeOf(context).height / 24),
                  bottom: (MediaQuery.sizeOf(context).height / 64)
                ),
                child: Text(
                  'ANDERCAR',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 20, 108, 148),
                  ),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(
                  bottom: (MediaQuery.sizeOf(context).height / 40)),
                child: const Divider(
                  color: Color.fromARGB(92, 20, 108, 148),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: (MediaQuery.sizeOf(context).width / 2)),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.oswald(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 20, 108, 148),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.sizeOf(context).width / 12),
                  right: (MediaQuery.sizeOf(context).width / 12),
                  top: (MediaQuery.sizeOf(context).height / 80),
                  bottom: (MediaQuery.sizeOf(context).height / 24)
                  ),
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
                    controller: _loginState.loginController,
                    style: GoogleFonts.oswald(
                      fontSize: 22,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    cursorColor: const Color.fromARGB(255, 20, 108, 148),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color.fromARGB(255, 175, 211, 223),
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
                      fillColor: const Color.fromARGB(255, 175, 211, 223),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite um texto';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: (MediaQuery.sizeOf(context).width / 2)),
                child: Text(
                  'SENHA',
                  style: GoogleFonts.oswald(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 20, 108, 148),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.sizeOf(context).width / 12),
                  right: (MediaQuery.sizeOf(context).width / 12),
                  top: (MediaQuery.sizeOf(context).height / 80),
                  bottom: (MediaQuery.sizeOf(context).height / 24)
                  ),
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
                          color: Color.fromARGB(255, 175, 211, 223),
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
                      fillColor: const Color.fromARGB(255, 175, 211, 223),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite um texto';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width / 16,
                  right: MediaQuery.sizeOf(context).width / 16,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 10,
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
                            if (context.mounted) {
                              await Navigator.pushNamed(context, '/userpage');
                            }
                          } else {
                            if (context.mounted) {
                              return showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'ATENÇÃO!',
                                      style: GoogleFonts.oswald(
                                        fontSize: 25,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 20, 108, 148),
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                            'Usuário ou Senha incorretos!',
                                            style: GoogleFonts.oswald(
                                              fontSize: 20,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 20, 108, 148),
                                            ),
                                          ),
                                          Text(
                                            'Digite Novamente.',
                                            style: GoogleFonts.oswald(
                                              fontSize: 20,
                                              letterSpacing: 2,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 20, 108, 148),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          'Ok!',
                                          style: GoogleFonts.oswald(
                                            fontSize: 20,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 20, 108, 148),
                                          ),
                                        ),
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
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 20, 108, 148),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 20, 108, 148),
                            ),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ENTRAR',
                          style: GoogleFonts.oswald(
                            fontSize: 35,
                            letterSpacing: 4,
                            color: const Color.fromARGB(255, 246, 241, 241),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only
                (top: MediaQuery.sizeOf(context).height / 40,
                bottom: MediaQuery.sizeOf(context).height / 80,),
                child: const Divider(
                  color: Color.fromARGB(92, 20, 107, 148),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/ownerlogin');
                },
                child: Text(
                  'Entrar como Dono',
                  style: GoogleFonts.oswald(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    color: const Color.fromARGB(255, 20, 108, 148),
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
