import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:yue_zone/src/login/login_view.dart';
import 'package:yue_zone/src/profile/profile_view.dart';
import 'package:yue_zone/src/setting/account/account_view.dart';
import 'package:yue_zone/src/setting/settings_controller.dart';
import 'package:yue_zone/src/setting/settings_view.dart';
import 'package:yue_zone/src/signup/signup_view.dart';

/// 屏幕尺寸：电脑、平板、手机
enum ScreenSize {desktop, tab, phone}

class YueZoneApp extends StatelessWidget {
  const YueZoneApp({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  /// /#/
  static const routeName = '/';

  /// YuePlus 的头像图片
  static final yuePlusAvatar = ClipOval(
    child: Image.network('https://avatars.githubusercontent.com/u/33195150'),
  );

  /// 获取屏幕尺寸
  static ScreenSize getScreenSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1600.0) return ScreenSize.desktop;
    if (screenWidth > 800.0) return ScreenSize.tab;
    return ScreenSize.phone;
  }

  Widget _home(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: l10n.settings,
            onPressed: () =>
                Navigator.pushNamed(context, SettingsView.routeName),
          ),
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: l10n.login,
            onPressed: () => Navigator.pushNamed(context, LoginView.routeName),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.welcome_message, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            SizedBox(
              width: 380,
              child: ListTile(
                leading: yuePlusAvatar,
                title: const Text('YuePlus'),
                subtitle: const Text('🕊🕊🕊 正在开发中……'),
                trailing: const Icon(Icons.arrow_right),
                onTap: () =>
                    Navigator.pushNamed(context, ProfileView.routeName),
              ),
            ),
          ],
        ),
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
          initialRoute: YueZoneApp.routeName,
          routes: {
            YueZoneApp.routeName: (context) => _home(context),
            SettingsView.routeName: (context) =>
                SettingsView(controller: settingsController),
            LoginView.routeName: (context) => const LoginView(),
            SignupView.routeName: (context) => const SignupView(),
            AccountView.routeName: (context) => const AccountView(),
            ProfileView.routeName: (context) => ProfileView(),
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
