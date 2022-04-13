import 'package:flutter/material.dart';
import 'package:yue_zone/src/login/login_view.dart';
import 'package:yue_zone/src/setting/setting_view.dart';

class YueZoneApp extends StatelessWidget {
  const YueZoneApp({Key? key}) : super(key: key);

  static const title = 'YueZone - 悦域';

  Widget _home(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: '设置',
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: '登入',
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
      body: const Center(
        child: Text('正在生成世界……', style: TextStyle(fontSize: 32)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => _home(context),
        '/settings': (context) => const SettingsView(),
        '/login': (context) => const LoginView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
