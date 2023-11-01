import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/theme_controller.dart';
import 'entities/dealership.dart';
import 'login_page.dart';
import 'screen/owner/admin_signup.dart';
import 'screen/owner/dealerships.dart';
import 'screen/owner/form_signup.dart';
import 'screen/owner/login_owner.dart';
import 'screen/owner/owner_homepage.dart';
import 'screen/user/cars_form.dart';
import 'screen/user/inventory.dart';
import 'screen/user/reports_dealership.dart';
import 'screen/user/sales.dart';
import 'screen/user/user_homepage.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, state, _) => MaterialApp(
          title: 'Projeto Final',
          debugShowCheckedModeBanner: false,
          initialRoute: '/ownerpage',
          routes: {
            '/login': (context) => const LoginController(),
            '/ownerlogin': (context) => const LoginAdminController(),
            '/ownerpage': (context) => const OwnerHomePage(),
            '/ownersignup': (context){
              final args = ModalRoute.of(context)!
              .settings.arguments as Dealership?;
              return  SignUpDealershipController(dealership: args,);
            },
            '/dealerships': (context) => const DealerhsipListController(),
            '/admins': (context) => const SignUpAdminController(),
            '/settings': (context) => const SettingsPage(),
            '/userpage': (context) => const UserHomePage(),
            '/carsform' :(context) => const CarScreenController(),
            '/sales' : (context) => const SalesScreen(),
            '/inventory' : (context) => const InventoryScreen(),
            '/dealershipreports' : (context) => const ReportsDealership(),
          },
        ),
      ),
    );
  }
}
