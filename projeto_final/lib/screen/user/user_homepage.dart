import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_controller.dart';
import '../utilities/background.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorState = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'AnderCar',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              color: const Color.fromARGB(255, 246, 241, 241),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundColor(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: colorState.isLight
                                  ? Colors.grey.shade400
                                  : const Color.fromARGB(255, 17, 34, 63),
                              spreadRadius: colorState.isLight ? 10 : 0,
                              blurRadius: 100,
                              offset: const Offset(-2, -2),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: (MediaQuery.sizeOf(context).height / 4) - 50,
                          width: (MediaQuery.sizeOf(context).height / 4) - 50,
                          child: ElevatedButton.icon(
                            onPressed: () async{
                              await Navigator.pushNamed(context, '/carsform');
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 20, 108, 148),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            icon: const Icon(
                              Icons.add,
                              size: 50.0,
                            ),
                            label: Center(
                              child: Text(
                                'add carros',
                                style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  color: 
                                  const Color.fromARGB(255, 246, 241, 241),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: colorState.isLight
                                  ? Colors.grey.shade400
                                  : const Color.fromARGB(255, 17, 34, 63),
                              spreadRadius: colorState.isLight ? 10 : 0,
                              blurRadius: 100,
                              offset: const Offset(-2, -2),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: (MediaQuery.sizeOf(context).height / 4) - 50,
                          width: (MediaQuery.sizeOf(context).height / 4) - 50,
                          child: ElevatedButton.icon(
                            onPressed: () async{
                              await Navigator.pushNamed(context, '/sales');
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 20, 108, 148),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            icon: const Icon(
                              Icons.attach_money,
                              size: 50.0,
                            ),
                            label: Center(
                              child: Text(
                                'add venda',
                                style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  color: 
                                  const Color.fromARGB(255, 246, 241, 241),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: colorState.isLight
                                ? Colors.grey.shade400
                                : const Color.fromARGB(255, 17, 34, 63),
                            spreadRadius: colorState.isLight ? 10 : 0,
                            blurRadius: 100,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: (MediaQuery.sizeOf(context).height / 4) - 50,
                        width: (MediaQuery.sizeOf(context).height / 4) - 50,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            await Navigator.pushNamed(context, '/inventory');
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 92, 193, 226),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.store,
                            size: 50.0,
                          ),
                          label: Center(
                            child: Text(
                              'checar loja',
                              style: GoogleFonts.oswald(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                color: const Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: colorState.isLight
                                ? Colors.grey.shade400
                                : const Color.fromARGB(255, 17, 34, 63),
                            spreadRadius: colorState.isLight ? 10 : 0,
                            blurRadius: 100,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: (MediaQuery.sizeOf(context).height / 4) - 50,
                        width: (MediaQuery.sizeOf(context).height / 4) - 50,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            await Navigator.pushNamed(context, '/dealershipreports');
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 92, 193, 226),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.report,
                            size: 50.0,
                          ),
                          label: Center(
                            child: Text(
                              'gerar relatórios',
                              style: GoogleFonts.oswald(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                color: const Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ),
                        ),
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
                            color: colorState.isLight
                                ? Colors.grey.shade400
                                : const Color.fromARGB(255, 17, 34, 63),
                            spreadRadius: colorState.isLight ? 10 : 0,
                            blurRadius: 100,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: (MediaQuery.sizeOf(context).height / 4) - 50,
                        width: (MediaQuery.sizeOf(context).height / 4) - 50,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            await Navigator.pushNamed(context, '/settings');
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 153, 212, 231),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.settings,
                            size: 50.0,
                          ),
                          label: Center(
                            child: Text(
                              'configurações',
                              style: GoogleFonts.oswald(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 3,
                                color: const Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: colorState.isLight
                                ? Colors.grey.shade400
                                : const Color.fromARGB(255, 17, 34, 63),
                            spreadRadius: colorState.isLight ? 10 : 0,
                            blurRadius: 100,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: (MediaQuery.sizeOf(context).height / 4) - 50,
                        width: (MediaQuery.sizeOf(context).height / 4) - 50,
                        child: ElevatedButton.icon(
                          onPressed: () async{
                            await Navigator.pushNamed(context, '/login');
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 153, 212, 231),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.logout,
                            size: 50.0,
                          ),
                          label: Center(
                            child: Text(
                              'log out',
                              style: GoogleFonts.oswald(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                                color: const Color.fromARGB(255, 246, 241, 241),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
