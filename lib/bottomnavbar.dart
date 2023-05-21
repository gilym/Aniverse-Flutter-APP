import 'package:flutter/material.dart';
import 'package:rillanime/profile.dart';
import 'package:rillanime/schedule.dart';
import 'package:rillanime/setting.dart';
import 'dashboard.dart';
import 'discover.dart';
import 'main.dart';


class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      Dashboard(),
      discover(),
      schedule(),
      profile(),
      setting()

    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Background
        ),

        height: 70,
        // Atur tinggi yang diinginkan
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Background,
          currentIndex: _selectedIndex,
          selectedItemColor: Darkmode? Color(0xFFD0FE42) : Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie, size: 30),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp, size: 30),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );


  }
}




