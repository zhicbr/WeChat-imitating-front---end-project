import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '微信',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: '通讯录',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '我',
        ),
      ],
    );
  }
}
