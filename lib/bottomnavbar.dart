import 'package:flutter/material.dart';
import 'dahsboard.dart';
import 'discover.dart';


class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Dashboard(),
      discover(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie ,size: 30,),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
              size: 30,),
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

