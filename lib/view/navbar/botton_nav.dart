import 'package:flutter/material.dart';
import 'package:stock_watchlist/view/home/home_screen.dart';
import 'package:stock_watchlist/view/watch_list/watch_list_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final List<Widget> _mainScreens = [
    const HomeScreen(),
    const WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainScreens[0],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list_outlined), label: "Watchlist")
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        onTap: (value) {},
      ),
    );
  }
}
