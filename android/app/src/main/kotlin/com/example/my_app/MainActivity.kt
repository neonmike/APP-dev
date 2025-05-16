package com.example.my_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val usageChannel = "usage_stats_channel"
    private val appManagerChannel = "com.example.app_manager/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 使用统计
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, usageChannel)
            .setMethodCallHandler(UsageStatsHandler(this))

        // 应用管理
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, appManagerChannel)
            .setMethodCallHandler(AppManagerHandler(this))
    }
}
