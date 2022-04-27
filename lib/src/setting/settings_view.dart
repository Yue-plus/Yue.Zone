import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:yue_zone/src/setting/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  /// 主题配置弹出菜单
  Future<void> _configThemeSimpleDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text(l10n.theme_configuration),
        children: [
          SimpleDialogOption(
            child: Text(l10n.dark_theme),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.dark);
              Navigator.pop(context, 1);
            },
          ),
          SimpleDialogOption(
            child: Text(l10n.light_theme),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.light);
              Navigator.pop(context, 1);
            },
          ),
          SimpleDialogOption(
            child: Text(l10n.follow_system),
            onPressed: () {
              controller.updateThemeMode(ThemeMode.system);
              Navigator.pop(context, 1);
            },
          ),
        ],
      ),
    );
  }

  /// 语言配置弹出菜单
  Future<void> _configLanguageSimpleDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text(l10n.language_configuration),
        children: [
          SimpleDialogOption(
            child: const Text('简体中文'),
            onPressed: () {
              controller.updateLocal(const Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hans',
              ));
              Navigator.pop(context, 1);
            },
          ),
          const SimpleDialogOption(
            child: Text('繁體中文'),
          ),
          SimpleDialogOption(
            child: const Text('English'),
            onPressed: () {
              controller.updateLocal(const Locale('en'));
              Navigator.pop(context, 1);
            },
          ),
          const SimpleDialogOption(
            child: Text('日本語'),
          ),
          SimpleDialogOption(
            child: Text(l10n.follow_system),
            onPressed: () {
              controller.updateLocal(null);
              Navigator.pop(context, 1);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 600,
          child: ListView(children: [
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text(l10n.theme),
              subtitle: Text(controller.themeMode.toString()),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _configThemeSimpleDialog(context),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(l10n.language),
              subtitle: Text(controller.locale.toString()),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _configLanguageSimpleDialog(context),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(l10n.account),
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
