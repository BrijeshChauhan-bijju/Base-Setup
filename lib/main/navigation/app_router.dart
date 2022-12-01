import 'package:base_setup/main/navigation/route_paths.dart';
import 'package:base_setup/presentation/page/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.userPage:
        return CupertinoPageRoute(
          builder: (context) => UserPage(),
          settings: const RouteSettings(name: RoutePaths.userPage),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
