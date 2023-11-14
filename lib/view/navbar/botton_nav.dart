import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/base_controller.dart';
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
    int currentIndex = Provider.of<BaseController>(context).selectedIndex;
    return Scaffold(
      body: _mainScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list_outlined), label: "Watchlist")
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        onTap: (value) =>
            Provider.of<BaseController>(context, listen: false).onTap(value),
      ),
    );
  }
}
