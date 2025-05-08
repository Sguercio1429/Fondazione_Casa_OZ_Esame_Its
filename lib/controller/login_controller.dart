import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/home_screen.dart';

class LoginController extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GoogleSignInAccount? get user => _user;

  Future<void> signInWithGoogle(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        _user = account;
        notifyListeners();
        navigator.pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } catch (e) {
      debugPrint('Errore durante il login con Google: $e');
    }
  }

  void signInWithCredentials(BuildContext context) {
    final navigator = Navigator.of(context);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == 'test@example.com' && password == 'password123') {
      navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email o password non validi')),
      );
    }
  }
}
