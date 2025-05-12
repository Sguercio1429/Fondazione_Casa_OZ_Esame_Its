import 'package:flutter/material.dart';
import '../widget/custom_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(),
      body: const Center(
        child: Text('BHome'),
      ),
    );
  }
}
