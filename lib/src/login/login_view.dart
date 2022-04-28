import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  /// /#/login
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登入'),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 400,
          padding: const EdgeInsets.all(8),
          child: Form(
            child: Column(
              children: [
                const Text('// TODO 登入……', style: TextStyle(fontSize: 32)),

                TextFormField(
                  keyboardType: TextInputType.url,
                  initialValue: 'https://Yue.Zone/',
                  decoration: const InputDecoration(
                    icon: Icon(Icons.domain),
                    labelText: '登入域',
                    hintText: 'http(s)://example.com/',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_box),
                    labelText: 'ID / 用户名 / 邮箱',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: '密码',
                  ),
                ),

                // 只用于调整按钮位置
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login),
                        onPressed: () {},
                        label: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text('登入', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),

                // 只用于调整按钮位置
                const SizedBox(height: 23),

                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/signup'),
                  child: const Text('没有账号？前往注册 →'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
