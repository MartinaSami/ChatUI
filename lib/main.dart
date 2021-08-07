import 'package:chat_page/AppColorCodes.dart';
import 'package:chat_page/lightDarkTheme.dart';
import 'package:chat_page/signUpPage/SignUp.dart';
import 'package:flutter/material.dart';
import 'dart:async';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: SignUp(),
    );
  }
}
