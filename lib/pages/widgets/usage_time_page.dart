import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsageTimePage extends StatefulWidget {
  const UsageTimePage({super.key});
  @override
  State<UsageTimePage> createState() => _UsageTimePageState();
}

class _UsageTimePageState extends State<UsageTimePage> {
  static const platform = MethodChannel('usage_stats_channel');

  bool _permissionGranted = false;
  int _totalUsageSeconds = 0;
  bool _loading = false;

  Future<bool> _checkPermission() async {
    try {
      final granted = await platform.invokeMethod<bool>('checkUsageStatsPermission') ?? false;
      setState(() {
        _permissionGranted = granted;
      });
      return granted;
    } on PlatformException catch (e) {
      debugPrint('Error checking usage stats permission: ${e.message}');
      return false;
    }
  }

  Future<void> _requestPermissionAndGetUsage() async {
    setState(() {
      _loading = true;
    });

    bool granted = await _checkPermission();
    if (!granted) {
      await platform.invokeMethod('openUsageAccessSettings');
      // 等待用户操作（这个时间可根据情况调整）
      await Future.delayed(const Duration(seconds: 3));
      granted = await _checkPermission();
    }
    if (granted) {
      final seconds = await platform.invokeMethod<int>('getTotalUsageTimeToday') ?? 0;
      setState(() {
        _totalUsageSeconds = seconds;
        _permissionGranted = true;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final secs = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('当天系统使用时长'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      size: 80,
                      color: Colors.deepPurple.shade400,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _permissionGranted
                          ? '权限已授权'
                          : '权限未授权，请点击下方按钮授权',
                      style: TextStyle(
                        fontSize: 18,
                        color: _permissionGranted ? Colors.green.shade700 : Colors.red.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('获取当天系统使用时长'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        backgroundColor: Colors.deepPurple,
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _loading ? null : _requestPermissionAndGetUsage,
                    ),
                    const SizedBox(height: 40),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: _loading
                          ? const SizedBox(
                        key: ValueKey('loading'),
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.deepPurple,
                        ),
                      )
                          : Text(
                        formatDuration(_totalUsageSeconds),
                        key: ValueKey<int>(_totalUsageSeconds),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '（格式：时:分:秒）',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}