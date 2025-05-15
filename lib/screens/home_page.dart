import 'package:flutter/material.dart';

// 引入刚刚创建的页面内容组件
import '../content/home_page_content.dart';
import '../content/feed_page_content.dart';
import '../content/quick_read_page_content.dart';
import '../content/profile_page_content.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // 使用新的页面组件替代之前的简单文本
  static final List<Widget> _pages = <Widget>[
    const HomePageContent(),
    const FeedPageContent(),
    const QuickReadPageContent(),
    const ProfilePageContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('less is more ,live better'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}
