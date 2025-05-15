import 'package:flutter/material.dart';
// 创建一个名为 BottomNavBar 的无状态组件（StatelessWidget）
class BottomNavBar extends StatelessWidget {
  // 当前选中的导航项索引（例如：第0项、第1项……）
  final int currentIndex;

  // 当用户点击导航项时触发的回调函数（接收一个 int 参数表示索引）
  final ValueChanged<int> onTap;

  // 构造函数，要求传入 currentIndex 和 onTap，super.key 是传递 widget 的 key（可选）
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // 重写 build 方法，定义组件的 UI
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // 设置底部导航栏的类型：fixed 表示图标和标签始终都显示（适合少于5项）
      type: BottomNavigationBarType.fixed,

      // 定义导航栏的项目列表（每项包含图标和标签）
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),     // 第1项的图标：聊天图标
          label: '主页',               // 第1项的标签：主页
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper), // 第2项的图标：联系人图标
          label: '信息流',             // 第2项的标签：信息流
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),  // 第3项的图标：探索图标
          label: '快读书',             // 第3项的标签：快读书
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),   // 第4项的图标：人物图标
          label: '我',                 // 第4项的标签：我（个人中心）
        ),
      ],

      // 当前选中的项目索引，用于高亮显示
      currentIndex: currentIndex,

      // 设置选中项的颜色
      selectedItemColor: Colors.green,

      // 点击某项时调用的回调函数，参数是点击项的索引
      onTap: onTap,
    );
  }
}
