import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/list_dealerships.dart';
import '../../entities/dealership.dart';
import '../utilities/background.dart';

Future<Map<String, bool?>?> dealershipsAlert(
  BuildContext context,
  Dealership dealership,
) async {
  final state = Provider.of<DealershipListProvider>(
    context,
    listen: false,
  );

  // var dealershipAutonomyLevel = '';

  // switch (dealership.autonomyLevel) {
  //   case '1':
  //     dealershipAutonomyLevel = 'Iniciante';
  //   case '2':
  //     dealershipAutonomyLevel = 'Intermediario';
  //   case '3':
  //     dealershipAutonomyLevel = 'Avançado';
  // }

  final alert = AlertDialog(
    scrollable: true,
    alignment: Alignment.center,
    title: Center(
      child: Text(
        dealership.name,
        style: GoogleFonts.oswald(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          letterSpacing: 3,
        ),
      ),
    ),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _IconTextDefault(icon: Icons.list, title: dealership.cnpj),
        _IconTextDefault(icon: Icons.lock, title: dealership.password),
        _IconTextDefault(
          icon: Icons.type_specimen,
          title: dealership.autonomyLevel,
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: CupertinoColors.systemYellow,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/ownersignup',
                  arguments: dealership);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.check,
              color: CupertinoColors.activeGreen,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: CupertinoColors.destructiveRed,
            ),
            onPressed: () async {
              await state.delete(dealership.id);
              if(context.mounted){
              Navigator.of(context).pop({'delete': true});
              }
            },
          ),
        ],
      ),
    ],
  );

  return showDialog<Map<String, bool?>>(
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

class DealerhsipListController extends StatelessWidget {
  const DealerhsipListController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DealershipListProvider>(
      create: (context) => DealershipListProvider(dealership: null),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 30, 0),
            child: Center(
              child: Text(
                'LISTAGEM DE LOJAS',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 246, 241, 241),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: const Stack(
          children: [
            BackgroundColor(),
            DealershipsList(),
          ],
        ),
      ),
    );
  }
}

class DealershipsList extends StatelessWidget {
  const DealershipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DealershipListProvider>(
      builder: (_, state2, __) {
        return ListView.builder(
          itemCount: state2.listDealership.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                state2.listDealership[index].name,
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3,
                  color: const Color.fromARGB(255, 246, 241, 241),
                ),
              ),
              leading: Image.file(
                        File(state2.listDealership[index].photo),
                        height: 80.0,
                      ),
              onTap: () async {
                final result = await dealershipsAlert(
                  context,
                  state2.listDealership[index],
                );
                if (result?['delete'] == true) {
                  await state2.load();
                }
              },
            );
          },
        );
      },
    );
  }
}

class _IconTextDefault extends StatelessWidget {
  const _IconTextDefault({required this.icon, required this.title});

  final IconData icon;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            Text(
              ' $title',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
