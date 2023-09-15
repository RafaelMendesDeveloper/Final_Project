import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/signup_controllers.dart';

class DealerhsipListController extends StatelessWidget {
  const DealerhsipListController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DealershipProvider(),
      child: const Scaffold(
        body: DealershipsList(),
      ),
    );
  }
}

class DealershipsList extends StatelessWidget {
  const DealershipsList({super.key});


  @override
  Widget build(BuildContext context) {
    final state =  Provider.of<DealershipProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
          child: Center(
            child: Text(
              'LISTAGEM DE LOJAS',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  letterSpacing: 3,
                  color: const Color.fromARGB(255, 246, 241, 241)),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
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
        child: ListView.builder(
          itemCount: state.listDealership.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.listDealership[index].name),
            );
          },
        ),
      ),
    );
  }
}
