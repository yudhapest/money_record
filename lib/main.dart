import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_record/common/styles.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/ui/home_page.dart';
import 'package:money_record/ui/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID').then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            secondary: secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
            foregroundColor: backgroundColor,
          )),
      home: FutureBuilder(
          future: Session.getUser(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data?.idUser != null) {
              return const HomePage();
            }
            return const LoginPage();
          }),
    );
  }
}
