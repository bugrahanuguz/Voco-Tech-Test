import 'package:flutter/material.dart';
import 'package:voco_tech_test/views/home_page.dart';
import 'package:voco_tech_test/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black.withOpacity(0.3)),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
