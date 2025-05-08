import 'package:flutter/material.dart';

class CredentialsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CredentialsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text(
        'Accedi con credenziali',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
