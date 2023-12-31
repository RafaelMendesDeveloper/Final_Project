import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/login_admin.dart';
import '../../controller/login_owner.dart';
import '../../controller/theme_controller.dart';
import '../utilities/background.dart';

class LoginAdminController extends StatelessWidget {
  const LoginAdminController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminProvider(),
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundColor(),
            OwnerLogin(),
          ],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

class OwnerLogin extends StatelessWidget {
  OwnerLogin({super.key});

  final _formOwnerKey = GlobalKey<FormState>();
  final _loginState = LoginAdmProvider();

  @override
  Widget build(BuildContext context) {
    final colorState = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height / 8,
            left: (MediaQuery.sizeOf(context).width / 2) - 
            (MediaQuery.sizeOf(context).width / 6 / 2),  
            ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / 6,
            height: MediaQuery.sizeOf(context).height / 12,
            child: IconButton(
             icon: Icon(
              Icons.arrow_back,
              size: MediaQuery.sizeOf(context).height / 20,
              color: Colors.white,
              weight: 20.0,
             ),
             onPressed: () => Navigator.pop(context),
             style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
                left: (MediaQuery.sizeOf(context).width / 24),
                right: (MediaQuery.sizeOf(context).width / 24),
                top: (MediaQuery.sizeOf(context).height / 5),
                bottom: (MediaQuery.sizeOf(context).height / 5)),
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
                  spreadRadius: 2,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Form(
              key: _formOwnerKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.sizeOf(context).width / 2),
                        top: MediaQuery.sizeOf(context).height / 16),
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.oswald(
                        fontSize: 25,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(
                          255,
                          20,
                          108,
                          148,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.sizeOf(context).width / 12),
                        right: (MediaQuery.sizeOf(context).width / 12),
                        top: (MediaQuery.sizeOf(context).height / 80),
                        bottom: (MediaQuery.sizeOf(context).height / 24)),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 24,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: GoogleFonts.oswald(
                          fontSize: 22,
                        ),
                        controller: _loginState.loginController,
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 20, 108, 148),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
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
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: (MediaQuery.sizeOf(context).width / 2),
                    ),
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
                        bottom: (MediaQuery.sizeOf(context).height / 20)),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 1,
                            blurRadius: 24,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: GoogleFonts.oswald(
                          fontSize: 22,
                        ),
                        controller: _loginState.passwordController,
                        obscureText: true,
                        cursorColor: const Color.fromARGB(255, 20, 108, 148),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 20, 108, 148),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
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
                              color: Color.fromARGB(
                                255,
                                20,
                                108,
                                148,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 175, 211, 223),
                        ),
                        validator: (value) {
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
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height / 10,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formOwnerKey.currentState!.validate()) {
                              final isValid = await _loginState.getAdmin(
                                  _loginState.loginController.text,
                                  _loginState.passwordController.text);
                              if (isValid != null &&
                                  isValid.password ==
                                      _loginState.passwordController.text) {
                                if (context.mounted) {
                                  await Navigator.pushNamed(
                                      context, '/ownerpage');
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
                                              255,
                                              20,
                                              108,
                                              148,
                                            ),
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
                                                    255,
                                                    20,
                                                    108,
                                                    148,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Digite Novamente.',
                                                style: GoogleFonts.oswald(
                                                  fontSize: 20,
                                                  letterSpacing: 2,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    20,
                                                    108,
                                                    148,
                                                  ),
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
                                                  255,
                                                  20,
                                                  108,
                                                  148,
                                                ),
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
                          child: Center(
                            child: Text(
                              'ENTRAR',
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
