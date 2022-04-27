import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:yue_zone/src/login/login_view.dart';
import 'package:yue_zone/src/setting/settings_controller.dart';
import 'package:yue_zone/src/setting/settings_view.dart';
import 'package:yue_zone/src/signup/signup_view.dart';

class YueZoneApp extends StatelessWidget {
  const YueZoneApp({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  Widget _home(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: l10n.settings,
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: l10n.login,
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
      body: Center(
        child: Text(l10n.welcome_message, style: const TextStyle(fontSize: 32)),
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
          // 用于在用户离开或在后台被杀死后，再返回应用时恢复路由堆栈。
          restorationScopeId: 'YueZoneApp',
          title: 'YueZone - 悦域',
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.title,
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
          locale: settingsController.locale,
          localizationsDelegates: const [
            // 本地化的代理类
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
            Locale('en', ''),
          ],
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
