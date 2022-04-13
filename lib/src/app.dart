import 'package:flutter/material.dart';
import 'package:yue_zone/src/setting/setting_view.dart';

class YueZoneApp extends StatelessWidget {
  const YueZoneApp({Key? key}) : super(key: key);

  static const String title = 'YueZone - 悦域';

  Widget _home(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(title),
      actions: [
        IconButton(icon: const Icon(Icons.settings), onPressed: () {
          Navigator.pushNamed(context, '/settings');
        }),
      ],
    ),
    body: const Center(
      child: Text('正在生成世界……', style: TextStyle(fontSize: 32)),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => _home(context),
        '/settings': (context) => const SettingsView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
