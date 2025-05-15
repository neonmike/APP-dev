import 'package:flutter/material.dart';
import 'dart:async';
import 'home_page.dart';

// 定义一个有状态组件 SplashScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // 构造函数

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // 创建对应状态
}

// 定义 SplashScreen 对应的状态类
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 在组件初始化时启动一个2秒的定时器
    Timer(const Duration(seconds: 2), () {
      // 2秒后跳转到首页，并替换当前页面（防止返回启动页）
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()), // 构造首页
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 构建启动页 UI
    return Scaffold(
      body: Container(
        color: Colors.green, // 背景颜色为绿色
        alignment: Alignment.center, // 内容居中
        child: const Text(
          '微信启动页', // 显示文字
          style: TextStyle(
            color: Colors.white, // 字体颜色为白色
            fontSize: 32,        // 字体大小为32
            fontWeight: FontWeight.bold, // 加粗字体
          ),
        ),
      ),
    );
  }
}
//createState() → initState() → build() → [等待2秒] → Timer回调 → pushReplacement(HomePage)