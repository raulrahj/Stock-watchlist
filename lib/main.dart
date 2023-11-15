import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/base_controller.dart';
import 'package:stock_watchlist/controller/search_controller.dart';
import 'package:stock_watchlist/view/navbar/botton_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BaseController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchController(),
        ),
      ],
      child: MaterialApp(
        title: 'Stock Watchlist',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
