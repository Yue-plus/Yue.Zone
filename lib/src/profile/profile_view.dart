import 'package:flutter/material.dart';
import 'package:yue_zone/src/app.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  /// /#/profile
  static const routeName = '/Yue_plus';

  late double _userInfoWidth;
  late double _fontSize;
  late ScreenSize screenSize;

  Widget _userInfo() {
    return Center(
      child: Text(
        '//TODO 展示用户信息',
        style: TextStyle(color: Colors.white, fontSize: _fontSize),
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
      _fontSize = 32;
    }

    if (screenSize == ScreenSize.tab) {
      _userInfoWidth = 300;
      _fontSize = 23;
    }

    if (screenSize == ScreenSize.phone) {
      _userInfoWidth = double.infinity;
      _fontSize = 23;
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
