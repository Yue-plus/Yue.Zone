import 'package:flutter/material.dart';
import 'package:yue_zone/src/app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  /// /#/profile
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yue_plus')),
      body: const Center(
        child: Text('//TODO /#/profile', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}
