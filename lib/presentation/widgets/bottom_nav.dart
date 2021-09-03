import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({this.selectedIndex = 0, required this.onTap});

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.save),
        //   label: 'Saved Accounts',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      elevation: 10,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.lightGreenAccent,
      unselectedItemColor: Colors.cyanAccent,
      onTap: onTap,
    );
  }
}
