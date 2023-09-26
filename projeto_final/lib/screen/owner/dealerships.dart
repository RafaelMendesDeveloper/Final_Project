import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/list_dealerships.dart';
import '../../controller/theme_controller.dart';
import '../../entities/dealership.dart';

Future<Map<String, bool?>?> dealershipsAlert(
  BuildContext context,
  Dealership dealership,
) async {
  final state = Provider.of<DealershipListProvider>(
    context,
    listen: false,
  );

  var dealershipAutonomyLevel = '';

  switch (dealership.autonomyLevel) {
    case '1':
      dealershipAutonomyLevel = 'Iniciante';
    case '2':
      dealershipAutonomyLevel = 'Intermediario';
    case '3':
      dealershipAutonomyLevel = 'Avançado';
  }

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
              // Navigator.of(context).pop(true);
              print(dealershipAutonomyLevel);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: CupertinoColors.destructiveRed,
            ),
            onPressed: () async {
              await state.delete(dealership.id);
              Navigator.of(context).pop({'delete': true});
            },
          ),
        ],
      ),
    ],
  );

  return await showDialog<Map<String, bool?>>(
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
                    color: const Color.fromARGB(255, 246, 241, 241)),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: const DealershipsList(),
      ),
    );
  }
}

class DealershipsList extends StatelessWidget {
  const DealershipsList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorState = Provider.of<ThemeProvider>(context);
    final gradientColors = colorState.isLight
        ? [
            const Color.fromARGB(255, 48, 182, 219),
            const Color.fromARGB(255, 40, 127, 159),
            const Color.fromARGB(255, 11, 119, 173),
            const Color.fromARGB(255, 3, 78, 124)
          ]
        : [
            const Color.fromARGB(255, 3, 78, 124),
            const Color.fromARGB(255, 1, 64, 86),
            const Color.fromARGB(255, 3, 53, 79),
            const Color.fromARGB(255, 0, 28, 46)
          ];
    return Consumer<DealershipListProvider>(
      builder: (_, state2, __) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: gradientColors,
            ),
          ),
          child: ListView.builder(
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
          ),
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
