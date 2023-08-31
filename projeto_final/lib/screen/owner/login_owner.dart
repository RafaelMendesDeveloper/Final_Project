import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/db_class.dart';

class OwnerLogin extends StatelessWidget {
   OwnerLogin({super.key});

  final _formOwnerKey = GlobalKey<FormState>();
  DbClass formAnderson = DbClass();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 175.0, bottom: 145.0),
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
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ],
            ),

            child: Form(
              key: _formOwnerKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 40, 0, 0),
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
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 25),
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
                        style: GoogleFonts.oswald(
                                fontSize: 22,
                        ),
                        controller: loginController,
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
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
                          if (value != 'anderson') {
                            flag = 0;
                            return 'nome de usuário incorreto';
                          }
                          flag = 1;
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 10, 100, 0),
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
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
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
                        style: GoogleFonts.oswald(
                                fontSize: 22,
                        ),
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 20, 108, 148)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
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
                          if (value != '123456' && flag == 1) {
                            return 'senha incorreta!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                    child: SizedBox(
                      width: 300.0,
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
                              if (_formOwnerKey.currentState!.validate()) {
                                formAnderson.login = loginController.text;
                                formAnderson.password = passwordController.text;
                                bool isValid =
                                    await formAnderson.andersonSignIn();
                                if (isValid) {
                                  Navigator.pushNamed(context, '/ownerpage');
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
