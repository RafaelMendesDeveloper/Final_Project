import 'package:flutter/material.dart';
import 'package:projeto_final/model/db_class.dart';
import 'package:projeto_final/screen/owner/form_signup.dart';
import 'package:projeto_final/screen/owner/login_owner.dart';
import 'package:projeto_final/screen/owner/owner_homepage.dart';
import 'package:projeto_final/screen/user/login_page.dart';
import 'package:projeto_final/screen/user/user_homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DbClass(),
      child: MaterialApp(
        title: 'Projeto Final',
        debugShowCheckedModeBanner: false,
        initialRoute: '/ownerpage',
        routes: {
    '/login': (context) => const LoginPage(),
    '/ownerlogin': (context) => const OwnerLogin (),
    '/ownerpage' : (context) => const OwnerHomePage(),
    '/userpage': (context) => const UserHomePage(),
    '/ownersignup': (context) => const SignUpDealerships(),
  },
      ),
    );
  }
}
