import 'package:flutter/material.dart';
import 'package:yue_zone/src/setting/settings_service.dart';

/// 此控制器将通过 [SettingsService] 将持久化数据添加到 Widget 上。
class SettingsController with ChangeNotifier {
  SettingsController(this._service);

  // 将 [SettingsService] 设置为私有变量，以便不直接使用。
  final SettingsService _service;

  // 将 [ThemeMode] 设置为私有变量，以便在不使用 [SettingsService]
  // 保存更改的情况下不会直接更新它。
  late ThemeMode _themeMode = ThemeMode.dark;

  // 允许 Widget 读取用户主题
  ThemeMode get themeMode => _themeMode;

  /// 从 [SettingsService] 加载用户设置。
  Future<void> loadSettings() async {
    _themeMode = await _service.themeMode();

    // 重要！通知监听器发生了变化。
    notifyListeners();
  }

  /// 根据用户选择更新并持久化 [ThemeMode]。
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    // 设置主题
    _themeMode = newThemeMode;

    // 重要！通知监听器发生了变化。
    notifyListeners();

    // 通过 [SettingsServices] 持久化设置。
    await _service.updateThemeMode(newThemeMode);
  }
}