import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  static const String id = 'verify_code_view';

  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Verify Code'),
      ),
    );
  }
}
