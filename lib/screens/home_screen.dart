import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF009E3D),
      ),
      body: const Center(
        child: Text(
          'Benvenuto nella Home!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
