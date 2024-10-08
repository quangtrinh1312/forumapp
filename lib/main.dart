import 'package:flutter/material.dart';
import 'package:forum_app/pages/home_page.dart';
import 'package:forum_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: LoginPage(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}