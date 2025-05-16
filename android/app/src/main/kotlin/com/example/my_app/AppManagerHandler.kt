package com.example.my_app

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AppManagerHandler(private val context: Context) : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getInstalledApps" -> {
                val pm = context.packageManager
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
                    Log.d("UninstallApp", "Attempting to uninstall $packageName")
                    val intent = Intent(Intent.ACTION_DELETE)
                    intent.data = Uri.parse("package:$packageName")
                    intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    context.startActivity(intent)
                    result.success(null)
                } else {
                    result.error("INVALID_ARGUMENT", "Package name required", null)
                }
            }
            else -> result.notImplemented()
        }
    }
}
