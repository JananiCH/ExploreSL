import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'destination.dart';
import 'guides.dart';
import 'settings.dart';

class NavigationBarClass extends StatefulWidget {
  const NavigationBarClass({super.key});

  @override
  State<NavigationBarClass> createState() => _NavigationBarClassState();
}

class _NavigationBarClassState extends State<NavigationBarClass> {
  int myIndex = 0;
  List<Widget> widgetList = [
    Home(),
    Guides(),
    ScreenA(),
    settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.blueAccent,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_4),
                label: 'Guides',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Destinations',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.greenAccent),
          ]),
    );
  }
}
