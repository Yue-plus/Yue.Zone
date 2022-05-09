import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  /// /#/profile
  static const routeName = '/Yue_plus';

  double _userInfoWidth = 600.0;
  double _fontSize = 32.0;

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
    double screenWidth = MediaQuery.of(context).size.width;
    Widget buildBody = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: _userInfoWidth, child: _userInfo()),
        Expanded(child: _userActivity()),
      ],
    );

    if (screenWidth > 1600) {
      _userInfoWidth = 600;
      _fontSize = 32;
    } else if (screenWidth > 800) {
      _userInfoWidth = 300;
      _fontSize = 23;
    } else {
      _fontSize = 18;
      buildBody = Column(
        children: [
          _userInfo(),
          Expanded(child: _userActivity()),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Yue_plus')),
        body: buildBody,
    );
  }
}
