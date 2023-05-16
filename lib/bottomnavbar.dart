import 'package:flutter/material.dart';
import 'package:rillanime/favorite.dart';
import 'package:rillanime/profile.dart';
import 'dahsboard.dart';
import 'discover.dart';


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
      profile()

    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: _widgetOptions,
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // Sesuaikan dengan tinggi yang diinginkan
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF191825),
           // Tambahkan properti elevation dengan nilai 0
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF865DFF),
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
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
      ),


    );
  }
}




