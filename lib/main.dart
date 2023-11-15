import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stock_watchlist/controller/base_controller.dart';
import 'package:stock_watchlist/controller/search_controller.dart';
import 'package:stock_watchlist/controller/watchlist_controller.dart';
import 'package:stock_watchlist/model/stock_model.dart';
import 'package:stock_watchlist/view/navbar/botton_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(StockModelAdapter());
  }
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
        ChangeNotifierProvider(
          create: (context) => WatchListController(),
        )
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
