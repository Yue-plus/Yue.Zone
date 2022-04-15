import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 800,
          padding: const EdgeInsets.all(8),
          child: Form(
            child: Column(
              children: [
                const Text('// TODO 注册……', style: TextStyle(fontSize: 32)),

                TextFormField(
                  keyboardType: TextInputType.url,
                  initialValue: 'https://Yue.Zone/',
                  decoration: const InputDecoration(
                    icon: Icon(Icons.domain),
                    labelText: '注册域',
                    hintText: 'http(s)://example.com/',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: '邮箱',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_box),
                    labelText: '昵称'
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: '密码',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: '确认密码',
                  ),
                ),

                // 只用于调整按钮位置
                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.join_full),
                        onPressed: () {},
                        label: const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text('注册', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),

                // 只用于调整按钮位置
                const SizedBox(height: 23),

                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text('已有账号？前往登入 →'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
