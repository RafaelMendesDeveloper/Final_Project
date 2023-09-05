import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealershipsList extends StatelessWidget {
  const DealershipsList({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Scaffold(
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
          // child:   ListView.builder(
          //     itemCount: stateUser.listUser.length,
          //     itemBuilder: (context, index) {
          //       final user = stateUser.listUser[index];
          //       return ListTile(
          //         leading: Text(user.id.toString()),
          //         title: Text(user.name),
          //         subtitle: Text(user.cnpj.toString()),
          //       );
          //     },
          //   ),
        ),
      ),
    );
  }
}
