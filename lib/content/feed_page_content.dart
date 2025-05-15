import 'package:flutter/material.dart';

class FeedPageContent extends StatelessWidget {
  const FeedPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('信息流', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Text('这里是你的信息流，包含新闻、文章和更新。'),
        Divider(),
        ListTile(
          leading: Icon(Icons.article),
          title: Text('新闻标题1'),
          subtitle: Text('新闻内容摘要...'),
        ),
        ListTile(
          leading: Icon(Icons.article),
          title: Text('新闻标题2'),
          subtitle: Text('新闻内容摘要...'),
        ),
      ],
    );
  }
}
