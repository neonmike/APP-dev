import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Flutter应用的入口函数，程序从这里开始执行
void main() {
  // 调用runApp启动Flutter应用，传入根Widget
  runApp(const MyApp());
}

// 定义一个无状态Widget，作为整个应用的根组件
class MyApp extends StatelessWidget {
  // 构造函数，使用const表示该Widget不可变且可编译时优化
  const MyApp({super.key});

  // 重写build方法，描述这个Widget的UI界面
  @override
  Widget build(BuildContext context) {
    // 返回一个MaterialApp，它是Flutter应用的核心，包含导航、主题等功能
    return MaterialApp(
      // 应用的标题，部分设备任务管理器或窗口标题会显示这个
      title: 'live better',

      // 定义应用的主题，primarySwatch是主题颜色，这里用绿色
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      // 应用启动后的首页（入口页面），这里是一个自定义的SplashScreen组件
      home: const SplashScreen(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),        // 英文
        Locale('zh', 'CN'),      // 简体中文
        Locale('zh', 'TW'),      // 繁体中文
      ],
    );
  }
}

