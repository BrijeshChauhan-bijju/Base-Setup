import 'package:base_setup/utils/font_size.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar({
  required int selectedIndex,
  required Function(int) onTap,
  required List<BottomNavigationBarItem> bottomBarItems,
}) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    unselectedFontSize: AppFontSize.f12,
    selectedFontSize:  AppFontSize.f16,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    items: bottomBarItems,
    onTap: (index) {
      onTap(index);
    },
  );
}
