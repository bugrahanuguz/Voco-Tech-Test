import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_tech_test/controllers/login_controllers.dart';
import 'package:voco_tech_test/views/home_page.dart';
import 'package:voco_tech_test/views/login_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final token = ref.watch(tokenProvider);
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black.withOpacity(0.3)),
      debugShowCheckedModeBanner: false,
      home: token != null ? const HomePage(): LoginPage(),
    );
  }
}
