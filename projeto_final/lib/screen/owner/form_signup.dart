// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/database.dart';
import '../../entities/dealership.dart';
// import '../../model/db_class.dart';

void main() {
  runApp(SignUpDealerships());
}

class DealershipState extends ChangeNotifier {
  DealershipState() {
    load();
  }

  final controller = DealershipController();

  final _controllerCnpj = TextEditingController();
  final _controllerDealershipName = TextEditingController();
  final _controllerAutonomyLevel = TextEditingController();
  final _controllerPassword = TextEditingController();

  final _listDealership = <Dealership>[];
  List<Dealership> get listDealership => _listDealership;

  TextEditingController get controllerCnpj => _controllerCnpj;
  TextEditingController get controllerDealershipName =>
      _controllerDealershipName;
  TextEditingController get controllerAutonomyLevel => _controllerAutonomyLevel;
  TextEditingController get controllerPassword => _controllerPassword;

  Future<void> insert() async {
    final dealership = Dealership(
        cnpj: controllerCnpj.text,
        name: controllerDealershipName.text,
        autonomyLevel: controllerAutonomyLevel.text,
        password: controllerPassword.text);

    await controller.insert(dealership);
    await load();

    controllerCnpj.clear();
    controllerDealershipName.clear();
    controllerAutonomyLevel.clear();
    controllerPassword.clear();

    notifyListeners();
  }

  Future<void> load() async {
    final list = await controller.select();

    listDealership.clear();
    listDealership.addAll(list);
    print('HERE ---------------------------------------> ${listDealership.length}');

    notifyListeners();
  }
}

class SignUpDealerships extends StatelessWidget {
   SignUpDealerships({super.key});

//  @override
//  State<SignUpDealerships> createState() => _SignUpDealershipsState();
//}

//class _SignUpDealershipsState extends State<SignUpDealerships> {
  final _dealershipState = DealershipState();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Center(
                  child: Text(
                    'CADASTRO',
                    style: GoogleFonts.oswald(
                        fontSize: 50,
                        letterSpacing: 4,
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
                                padding:
                                    const EdgeInsets.fromLTRB(55, 30, 100, 0),
                                child: Text(
                                  'CNPJ',
                                  style: GoogleFonts.oswald(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                            child: TextFormField(
                              controller: _dealershipState.controllerCnpj,
                              cursorColor:
                                  const Color.fromARGB(255, 246, 241, 241),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(255, 246, 241, 241)),
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
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(55, 0, 100, 0),
                                child: Text(
                                  'NOME DA LOJA',
                                  style: GoogleFonts.oswald(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextFormField(
                              controller:
                                  _dealershipState.controllerDealershipName,
                              cursorColor:
                                  const Color.fromARGB(255, 246, 241, 241),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(255, 246, 241, 241)),
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
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(55, 0, 100, 0),
                                child: Text(
                                  'NIVEL DE AUTONOMIA',
                                  style: GoogleFonts.oswald(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextFormField(
                              controller:
                                  _dealershipState.controllerAutonomyLevel,
                              cursorColor:
                                  const Color.fromARGB(255, 246, 241, 241),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(255, 246, 241, 241)),
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
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(55, 0, 100, 0),
                                child: Text(
                                  'SENHA ',
                                  style: GoogleFonts.oswald(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: const Color.fromARGB(
                                          255, 246, 241, 241)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: TextFormField(
                              controller: _dealershipState.controllerPassword,
                              showCursor: false,
                              cursorColor:
                                  const Color.fromARGB(255, 246, 241, 241),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color:
                                          Color.fromARGB(255, 246, 241, 241)),
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
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await _dealershipState.insert();
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                        Color.fromARGB(255, 20, 108, 148),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 20, 108, 148),
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Text('LOGIN!'),
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
          ),
        ],
      ),
    );
  }
}
