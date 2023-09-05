import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/db_class.dart';
import 'screen/owner/dealerships.dart';
import 'screen/owner/form_signup.dart';
import 'screen/owner/login_owner.dart';
import 'screen/owner/owner_homepage.dart';
import 'screen/user/login_page.dart';
import 'screen/user/user_homepage.dart';

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
        initialRoute: '/login',
        routes: {
    '/login': (context) =>  LoginPage(),
    '/ownerlogin': (context) => OwnerLogin (),
    '/ownerpage' : (context) => OwnerHomePage(),
    '/userpage': (context) =>  UserHomePage(),
    '/ownersignup': (context) =>  SignUpDealerships(),
    '/dealerships': (context) => DealershipsList(),
  },
      ),
    );
  }
}
