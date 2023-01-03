import 'package:base_setup/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:base_setup/presentation/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:base_setup/presentation/page/second_page.dart';
import 'package:base_setup/presentation/page/third_page.dart';
import 'package:base_setup/presentation/page/user_page.dart';
import 'package:base_setup/ui/molecules/navigation_bar/bottom_navigation_bar.dart';
import 'package:base_setup/ui/molecules/navigation_bar/bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const UserPage(),
    const CalendarPage(),
    const ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(builder: (context, page) {
      return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavigationBar(
          selectedIndex: page,
          onTap: (index) {
            // to change the state of selected tab
            context.read<BottomNavigationBloc>().add(
                  PageTapped(
                    selectedPage: index,
                  ),
                );
          },
          bottomBarItems: bottomNavigationBarItems(),
        ),
        body: _widgetOptions.elementAt(page),
      );
    });
  }
}
