import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/login_controller.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
