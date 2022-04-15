import 'package:flutter/material.dart';
import 'package:yue_zone/src/login/login_view.dart';
import 'package:yue_zone/src/setting/settings_controller.dart';
import 'package:yue_zone/src/setting/settings_view.dart';
import 'package:yue_zone/src/signup/signup_view.dart';

class YueZoneApp extends StatelessWidget {
  const YueZoneApp({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

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
        child: Text('// TODO 生成世界……', style: TextStyle(fontSize: 32)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 将 [SettingsController] 连接到 [MaterialApp]。
    //
    // [AnimatedBuilder] Widget 监听 [SettingsController] 的变化。
    // 每当用户更新设置时，都会重新构建 [MaterialApp]。
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: title,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => _home(context),
            '/settings': (context) =>
                SettingsView(controller: settingsController),
            '/login': (context) => const LoginView(),
            '/signup': (context) => const SignupView(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
