import 'package:flutter/material.dart';
import 'package:yue_zone/src/setting/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  /// 主题配置弹出菜单
  _configThemeSimpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('设置主题'),
        children: [
          SimpleDialogOption(
            child: const Text('深色'),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.dark);
              Navigator.pop(context, 1);
            },
          ),
          SimpleDialogOption(
            child: const Text('浅色'),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.light);
              Navigator.pop(context, 1);
            },
          ),
          SimpleDialogOption(
            child: const Text('跟随系统'),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.system);
              Navigator.pop(context, 1);
            },
          ),
        ],
      ),
    );
  }

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
              subtitle: Text(controller.themeMode.toString()),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _configThemeSimpleDialog(context),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('账户'),
              subtitle: const Text('Yue_plus@foxmail.com'),
              trailing: const Icon(Icons.arrow_right),
              enabled: false,
              onTap: () {},
            ),
            const Text('YueZone - 悦域 v0.0.0', textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}
