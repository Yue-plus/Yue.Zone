import 'package:flutter/material.dart';

/// 此服务用于保存与检索用户设置。
class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.dark;

  Future<void> updateThemeMode(ThemeMode theme) async {
    // TODO 使用 `shared_preferences` 包持久化用户设置。
  }
}