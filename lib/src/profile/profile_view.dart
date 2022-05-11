import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yue_zone/src/app.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  /// /#/profile
  static const routeName = '/Yue_plus';

  late double _userInfoWidth;
  late double _padding;
  late double _fontSize;
  late ScreenSize screenSize;

  Widget _userInfo() {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: screenSize == ScreenSize.desktop ? 128 : 64,
                  child: YueZoneApp.yuePlusAvatar,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: _padding),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SelectableText(
                          'Yue_plus',
                          style: TextStyle(fontSize: _fontSize * 1.8),
                        ),
                        SelectableText(
                          '喵喵喵~',
                          style: TextStyle(fontSize: _fontSize * 0.6),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _padding),
            Row(
              children: [
                const Icon(Icons.email),
                TextButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('mailto: Yue_plus@foxmail.com')),
                  child: const Text('Yue_plus@foxmail.com'),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.link),
                TextButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://github.com/Yue-plus')),
                  child: const Text('https://github.com/Yue-plus'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _userActivity() {
    return Center(
      child: Text(
        '//TODO 展示用户活动',
        style: TextStyle(color: Colors.white, fontSize: _fontSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = YueZoneApp.getScreenSize(context);

    if (screenSize == ScreenSize.desktop) {
      _userInfoWidth = 600;
      _padding = 23;
      _fontSize = 32;
    }

    if (screenSize == ScreenSize.tab) {
      _userInfoWidth = 300;
      _padding = 18;
      _fontSize = 23;
    }

    if (screenSize == ScreenSize.phone) {
      _userInfoWidth = double.infinity;
      _padding = 12;
      _fontSize = 18;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Yue_plus')),
      body: Flex(
        direction:
            // Vertical: 垂直的； Horizontal: 水平的；
            screenSize == ScreenSize.phone ? Axis.vertical : Axis.horizontal,
        children: [
          SizedBox(width: _userInfoWidth, child: _userInfo()),
          Expanded(child: _userActivity()),
        ],
      ),
    );
  }
}
