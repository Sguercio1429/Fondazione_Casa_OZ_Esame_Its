import 'package:flutter/material.dart';
import '../widget/custom_top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(),
      body: const Center(child: Text('Profile')),
    );
  }
}
