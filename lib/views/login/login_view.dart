import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login View'),
      ),
    );
  }
}
