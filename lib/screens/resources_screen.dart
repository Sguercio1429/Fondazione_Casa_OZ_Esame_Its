import 'package:flutter/material.dart';
import '../widget/custom_button.dart';

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

    final List<String> iconPaths = List.generate(6, (_) => 'assets/icons/resources.png'); // Usa icone diverse se disponibili

    return Scaffold(
      appBar: AppBar(
        title: const Text('Risorse'),
        backgroundColor: const Color(0xFF009E3D),
      ),
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
