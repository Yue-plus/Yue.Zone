import 'package:flutter/material.dart';
import 'package:yue_zone/src/app.dart';
import 'package:yue_zone/src/setting/settings_controller.dart';
import 'package:yue_zone/src/setting/settings_service.dart';

void main() async {
  // 使用 [SettingsController] 将用户设置添加到 Flutter Widget 上。
  final settingsController = SettingsController(SettingsService());

  // 在显示初始屏幕时加载用户的首选主题，防止在首次打开应用时突然变主题。
  await settingsController.loadSettings();

  // 运行应用并传入 [SettingsController]。
  // 该应用监听 [SettingsController] 的更改，然后将其进一步传递给 [SettingsView]。
  runApp(YueZoneApp(settingsController: settingsController));
}
