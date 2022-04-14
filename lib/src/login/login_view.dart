import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('登入'),
        ),
        body: const Center(
          child: SizedBox(
            width: 600,
            child: Text('// TODO 登入……', style: TextStyle(fontSize: 32)),
          ),
        )
    );
  }
}