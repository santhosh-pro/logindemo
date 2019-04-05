import 'package:flutter/material.dart';
import 'package:logindemo/constants.dart';
import 'package:logindemo/presentation/pages/login_page.dart';

void main() {
  Constants.setEnvironment(Environment.DEV);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}
