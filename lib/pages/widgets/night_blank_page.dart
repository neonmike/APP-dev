import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 用于退出 App

class NightBlankPage extends StatefulWidget {
  const NightBlankPage({super.key});

  @override
  State<NightBlankPage> createState() => _NightBlankPageState();
}

class _NightBlankPageState extends State<NightBlankPage> {
  int _secondsRemaining = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 1) {
        timer.cancel();
        SystemNavigator.pop(); // 关闭 App（仅适用于 Android）,iOS不允许这种行为
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          '夜间时间，应用将在 $_secondsRemaining 秒后关闭',
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
