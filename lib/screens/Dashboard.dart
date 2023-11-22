import 'package:flutter/material.dart';
import 'package:nearease/main.dart';
import 'package:nearease/screens/EAForYouTabScreen.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppointmentScreen.dart';
import 'DiscoverScreen.dart';
import 'MessagesScreen.dart';
import 'EventsScreen.dart';
import 'ProfileScreen.dart';

class DashedBoardScreen extends StatefulWidget {
  static String tag = '/DashedBoardScreen';

  @override
  DashedBoardScreenState createState() => DashedBoardScreenState();
}

class DashedBoardScreenState extends State<DashedBoardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    DiscoverScreen(),
    EAForYouTabScreen(),
    AppointmentScreen(),
    MessagesScreen(),
    // ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(color: ColorPrimary),
      selectedItemColor: ColorPrimary,
      unselectedLabelStyle: const TextStyle(color: GreyColor),
      unselectedItemColor: GreyColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Events'),
        BottomNavigationBarItem(
            icon: Icon(Icons.date_range), label: 'Appointment'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
