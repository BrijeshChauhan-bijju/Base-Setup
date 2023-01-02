import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems() {
  return [
    _bottomNavigationItem(
      icon: Icons.home,
      iconColor: Colors.grey,
      title: 'HOME',
      activeIconColor: Colors.blue,
      activeIcon: Icons.home,
    ),
    _bottomNavigationItem(
      icon: Icons.calendar_month,
      iconColor: Colors.grey,
      title: 'CALENDAR',
      activeIconColor: Colors.blue,
      activeIcon: Icons.calendar_month,
    ),
    _bottomNavigationItem(
      icon: Icons.supervised_user_circle_outlined,
      iconColor: Colors.grey,
      title: 'USERS',
      activeIconColor: Colors.blue,
      activeIcon: Icons.supervised_user_circle_outlined,
    ),
  ];
}

BottomNavigationBarItem _bottomNavigationItem({
  required IconData icon,
  required Color iconColor,
  required String title,
  required Color activeIconColor,
  required IconData activeIcon,
}) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      color: iconColor,
    ),
    label: title,
    activeIcon: Icon(
      activeIcon,
      color: activeIconColor,
    ),
  );
}
