import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('设置')),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 600,
            child: ListView(children: [
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text('主题'),
                subtitle: const Text('暗色'),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('账户'),
                subtitle: const Text('Yue_plus@foxmail.com'),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {},
              ),
              const Text('YueZone - 悦域 v0.0.0', textAlign: TextAlign.center),
            ]),
          ),
        ));
  }
}
