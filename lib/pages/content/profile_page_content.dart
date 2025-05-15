import 'package:flutter/material.dart';

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/avatar.png'), // 头像图片，需你准备资源
          ),
          SizedBox(height: 20),
          Text('我', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('个人信息和设置', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
