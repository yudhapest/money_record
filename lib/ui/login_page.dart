import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:money_record/common/styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DView.nothing(),
              Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  DView.spaceHeight(40.0),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                  DView.spaceHeight(15.0),
                ],
              ),
              Row(
                children: const [
                  Text('Belum Punya akun?'),
                  Text(
                    'Daftar',
                    style: TextStyle(color: primaryColor),
                  )
                ],
              )
            ],
          );
        }));
  }
}
