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
      appBar: AppBar(
              title: Container(
                margin: const EdgeInsets.fromLTRB(180, 5, 0, 0),
                child: Text(
                  'HOME',
                  style: GoogleFonts.oswald(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: const Color.fromARGB(255, 246, 241, 241)),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(212, 15, 0, 0),
                    child: Text('Anderson', style: GoogleFonts.oswald(
                        fontSize: 25,
                        letterSpacing: 4,
                        color: const Color.fromARGB(255, 246, 241, 241)),
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
                      height: (MediaQuery.sizeOf(context).height / 4) - 30,
                      width: (MediaQuery.sizeOf(context).height / 4) - 30,
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
                      height: (MediaQuery.sizeOf(context).height / 4) - 30,
                      width: (MediaQuery.sizeOf(context).height / 4) - 30,
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
                      height: (MediaQuery.sizeOf(context).height / 4) - 30,
                      width: (MediaQuery.sizeOf(context).height / 4) - 30,
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
                      height: (MediaQuery.sizeOf(context).height / 4) - 30,
                      width: (MediaQuery.sizeOf(context).height / 4) - 30,
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
                      height: (MediaQuery.sizeOf(context).height / 4) - 30,
                      width: (MediaQuery.sizeOf(context).height / 4) - 30,
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
    );
  }
}
