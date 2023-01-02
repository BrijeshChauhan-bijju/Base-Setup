import 'package:base_setup/generated/l10n.dart';
import 'package:base_setup/main/navigation/route_paths.dart';
import 'package:flutter/material.dart';

Widget sideNavigationBar({
  required BuildContext context,
}) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
              child: Text(
            S.of(context).drawerHeader,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
        ),
        _setListTile(
          title: S.of(context).fourthPage,
          context: context,
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
              context,
              RoutePaths.fourthPage,
            );
          },
        ),
      ],
    ),
  );
}

ListTile _setListTile(
    {required String title,
    required BuildContext context,
    required Function() onTap}) {
  return ListTile(
    title: Text(title),
    onTap: () {
      onTap();
    },
  );
}
