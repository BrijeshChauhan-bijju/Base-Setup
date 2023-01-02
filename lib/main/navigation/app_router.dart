import 'package:base_setup/main/navigation/route_paths.dart';
import 'package:base_setup/presentation/page/bottom_navigation_screen.dart';
import 'package:base_setup/presentation/page/fourth_page.dart';
import 'package:base_setup/presentation/page/second_page.dart';
import 'package:base_setup/presentation/page/third_page.dart';
import 'package:base_setup/presentation/page/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.userPage:
        return CupertinoPageRoute(
          builder: (context) => const UserPage(),
          settings: const RouteSettings(name: RoutePaths.userPage),
        );

      case RoutePaths.bottomNavigationPage:
        return CupertinoPageRoute(
          builder: (context) => const BottomNavigationScreen(),
          settings: const RouteSettings(name: RoutePaths.bottomNavigationPage),
        );

      case RoutePaths.secondPage:
        return CupertinoPageRoute(
          builder: (context) => const CalendarPage(),
          settings: const RouteSettings(name: RoutePaths.secondPage),
        );

      case RoutePaths.thirdPage:
        return CupertinoPageRoute(
          builder: (context) => const ThirdPage(),
          settings: const RouteSettings(name: RoutePaths.thirdPage),
        );

      case RoutePaths.fourthPage:
        return CupertinoPageRoute(
          builder: (context) => const FourthPage(),
          settings: const RouteSettings(name: RoutePaths.fourthPage),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
