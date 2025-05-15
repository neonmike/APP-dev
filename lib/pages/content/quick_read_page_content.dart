import 'package:flutter/material.dart';

class QuickReadPageContent extends StatelessWidget {
  const QuickReadPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.book, size: 80, color: Colors.orange),
          SizedBox(height: 20),
          Text('快读书', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('快速阅读精选书籍和摘要，帮你高效获取知识。', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
