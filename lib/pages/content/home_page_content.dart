import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/models/score_model.dart';
import '../widgets/score_progress_indicator.dart';
import '../widgets/deleteListapp.dart';
import '../widgets/usage_time_page.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final score = context.watch<ScoreModel>().score; // 监听分数变化，方便进行重新绘制UI
//     return Scaffold(
//       body: Center(
//         child: Column( // 使用 Column 来垂直排列 ScoreProgressIndicator 和按钮
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ScoreProgressIndicator(score: score),
//             const SizedBox(height: 20), // 添加一些间距
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NewPage()), // 导航到 NewPage
//                 );
//               },
//               child: const Text('建议应用删除'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget build(BuildContext context) {
    final score = context
        .watch<ScoreModel>()
        .score; // 监听分数变化，方便重新绘制UI
    return Scaffold(
      body: Center(
        child: Column( // 垂直排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScoreProgressIndicator(score: score),
            const SizedBox(height: 20), // 间距
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewPage()), // 跳转NewPage
                );
              },
              child: const Text('建议应用删除'),
            ),
            const SizedBox(height: 12), // 两按钮间间距
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsageTimePage()), // 跳转使用时长页面
                );
              },
              child: const Text('查看使用时长'),
            ),
          ],
        ),
      ),
    );
  }
}