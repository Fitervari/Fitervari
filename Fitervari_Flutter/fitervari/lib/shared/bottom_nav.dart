import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.running, size: 20), label: 'Training'),
        const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar, size: 20),
            label: 'Statisitk'),
        const BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userCircle, size: 20),
            label: 'Profile'),
      ].toList(),
      selectedItemColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.pushNamed(context, '/training');
            break;
          case 1:
            Navigator.pushNamed(context, '/statistic');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
