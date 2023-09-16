import 'package:flutter/material.dart';

import 'screen/owner/admin_signup.dart';
import 'screen/owner/dealerships.dart';
import 'screen/owner/form_signup.dart';
import 'screen/owner/login_owner.dart';
import 'screen/owner/owner_homepage.dart';
import 'screen/owner/settings.dart';
import 'screen/user/login_page.dart';
import 'screen/user/user_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//criar um provider pra cada tela por isso que esta acontecendo o erro.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Final',
      debugShowCheckedModeBanner: false,
      initialRoute: '/ownerpage',
      routes: {
        '/login': (context) => LoginPage(),
        '/ownerlogin': (context) => OwnerLogin(),
        '/ownerpage': (context) => const OwnerHomePage(),
        '/userpage': (context) => const UserHomePage(),
        '/ownersignup': (context) => SignUpDealerships(),
        '/dealerships': (context) => const DealerhsipListController(),
        '/admins': (context) => SignUpAdmin(),
        '/settings': (context) => const SettingsController(),
      },
    );
  }
}
