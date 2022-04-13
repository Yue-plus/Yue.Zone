import 'package:flutter/material.dart';

void main() {
  const String title = 'YueZone | 悦域';

  runApp(MaterialApp(
    title: title,
    theme: ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text(title, textDirection: TextDirection.ltr),
      ),
      body: const Center(
        child: Text('正在生成世界……', style: TextStyle(fontSize: 32),),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
