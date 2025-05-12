import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widget/main_page.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> signInWithCredentials(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email == 'prova@gmail.com' && password == 'prova123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email o password errati')),
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
        );
      }
    } catch (e) {
      print('Errore login Google: $e');
    }
  }
}
