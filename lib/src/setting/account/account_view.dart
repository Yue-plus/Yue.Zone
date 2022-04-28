import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  /// /#/settings/account
  static const routeName = '/settings/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('账号')),
      body: const Center(
        child: Text('//TODO 修改账号资料', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}