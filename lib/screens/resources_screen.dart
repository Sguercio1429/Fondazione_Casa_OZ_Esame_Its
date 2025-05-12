import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import '../widget/custom_top_bar.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = [
      'Guida introduttiva',
      'Supporto tecnico',
      'FAQ',
      'Staff',
      'Prenotazioni',
      'Menù',
    ];

    final List<String> iconPaths =
    List.generate(6, (_) => 'assets/icons/resources.png');

    return Scaffold(
      appBar: const CustomTopBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                text: buttonLabels[index],
                imagePath: iconPaths[index],
                onPressed: () {
                  print('Hai premuto: ${buttonLabels[index]}');
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
