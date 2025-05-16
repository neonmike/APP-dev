
// 假设这是您的 NewPage Widget (如果还没有创建，请创建这个文件)
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
// class NewPage extends StatelessWidget {
//   const NewPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('新页面'),
//       ),
//       body: const Center(
//         child: Text('这是新的页面！'),
//       ),
//     );
//   }
// }


class NewPage extends StatelessWidget {
  static const platform = MethodChannel('com.example.app_manager/channel');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppListPage(),
    );
  }
}

class AppListPage extends StatefulWidget {
  @override
  _AppListPageState createState() => _AppListPageState();
}

class _AppListPageState extends State<AppListPage> {
  List<Map<dynamic, dynamic>> apps = [];

  @override
  void initState() {
    super.initState();
    fetchApps();
  }

  Future<void> fetchApps() async {
    try {
      final result = await NewPage.platform.invokeMethod('getInstalledApps');
      setState(() {
        apps = List<Map<dynamic, dynamic>>.from(result);
      });
    } catch (e) {
      print('Failed to get apps: $e');
    }
  }

  void uninstallApp(String packageName) {
    NewPage.platform.invokeMethod('uninstallApp', {'packageName': packageName});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('已安装的应用')),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];
          return ListTile(
            title: Text(app['appName']),
            subtitle: Text(app['packageName']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => uninstallApp(app['packageName']),
            ),
          );
        },
      ),
    );
  }
}