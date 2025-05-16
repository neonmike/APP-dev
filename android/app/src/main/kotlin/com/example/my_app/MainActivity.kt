package com.example.my_app

import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.util.Log
class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.app_manager/channel"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getInstalledApps" -> {
                    val pm = packageManager
                    val apps = pm.getInstalledApplications(PackageManager.GET_META_DATA)
                        .filter { pm.getLaunchIntentForPackage(it.packageName) != null }
                        .map {
                            mapOf(
                                "appName" to pm.getApplicationLabel(it).toString(),
                                "packageName" to it.packageName
                            )
                        }
                    result.success(apps)
                }
                "uninstallApp" -> {
                    val packageName = call.argument<String>("packageName")
                    if (packageName != null) {
                        Log.d("UninstallApp", "Attempting to open app details for $packageName")
//
//                        // 替换卸载Intent为跳转应用详情页的Intent，测试跳转是否成功
//                        val intent = Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
//                        intent.data = Uri.parse("package:$packageName")
//                        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
//                        startActivity(intent)


                        val intent = Intent(Intent.ACTION_DELETE)
                        intent.data = Uri.parse("package:$packageName")
                        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                        startActivity(intent)
                        result.success(null)
                    } else {
                        result.error("INVALID_ARGUMENT", "Package name required", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }
}

