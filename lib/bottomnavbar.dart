import 'package:flutter/material.dart';
import 'package:rillanime/favorite.dart';
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
      favorites(),
      discover(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF191825),
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF57b5cb),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie, size: 30),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Discover',
          ),
        ],
      ),
    );
  }
}


// class BotNavBar extends StatefulWidget {
//   const BotNavBar({Key? key}) : super(key: key);
//
//   @override
//   State<BotNavBar> createState() => _BotNavBarState();
// }
//
// class _BotNavBarState extends State<BotNavBar> {
//   int _selectedIndex = 0;
//   bool _isLoading = false;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _isLoading = true; // set isLoading true ketika memulai animasi loading
//       _selectedIndex = index;
//     });
//     // simulasi delay selama 1 detik untuk menampilkan animasi loading
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         _isLoading = false; // set isLoading false setelah selesai animasi loading
//       });
//     });
//   }
//
//   Widget build(BuildContext context) {
//     List<Widget> _widgetOptions = <Widget>[
//       Dashboard(),
//       discover(),
//     ];
//
//     return Scaffold(
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 500), // durasi animasi
//         child: _isLoading
//             ? Center(
//           child: CircularProgressIndicator(), // widget animasi loading
//         )
//             : IndexedStack(
//           index: _selectedIndex,
//           children: _widgetOptions,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help_outline),
//             label: 'Discover',
//           ),
//         ],
//       ),
//     );
//   }
// }

