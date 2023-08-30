import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerHomePage extends StatefulWidget {
   OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Color.fromARGB(255, 137, 221, 244),
              Color.fromARGB(255, 73, 159, 190),
              Color.fromARGB(255, 25, 167, 236),
              Color.fromARGB(255, 15, 161, 252),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 50.0, bottom: 50.0),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 4,
                        width: MediaQuery.sizeOf(context).height / 4,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ownersignup');
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 20, 108, 148)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('adicionar usuários',
                                  style: GoogleFonts.oswald(
                                      fontSize: 20,
                                      letterSpacing: 3,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            )),
                      ),
                    ),
                    Container(
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
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 4,
                        width: MediaQuery.sizeOf(context).height / 4,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 20, 108, 148)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('checar lojas',
                                  style: GoogleFonts.oswald(
                                      fontSize: 20,
                                      letterSpacing: 3,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 8,
                        width: MediaQuery.sizeOf(context).height / 2,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 175, 211, 223)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('gerar relatórios',
                                  style: GoogleFonts.oswald(
                                      fontSize: 25,
                                      letterSpacing: 3,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 10,
                        width: MediaQuery.sizeOf(context).height / 4,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 176, 196, 222)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('configurações',
                                  style: GoogleFonts.oswald(
                                      fontSize: 15,
                                      letterSpacing: 3,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            )),
                      ),
                    ),
                    Container(
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
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height / 10,
                        width: MediaQuery.sizeOf(context).height / 4,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 72, 61, 139)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text('log out',
                                  style: GoogleFonts.oswald(
                                      fontSize: 15,
                                      letterSpacing: 3,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241))),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
