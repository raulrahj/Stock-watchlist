import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stock_watchlist/controller/services/base.dart';
import 'package:stock_watchlist/model/stock_model.dart';

class WatchListController extends ChangeNotifier {
  STOCKLIST stockList = [];

  Future<void> addStocks(StockModel value) async {
    if (!stockList.contains(value)) {
      final stocksDB = await Hive.openBox<StockModel>('savedStocks_db');
      final id = await stocksDB.add(value);
      value.id = id;
      stockList.add(value);
      notifyListeners();
    }
  }

  Future<void> getAllStocks() async {
    final stocksDB = await Hive.openBox<StockModel>('savedStocks_db');
    stockList.clear();
    notifyListeners();
    stockList.addAll(stocksDB.values);
  }

  Future<void> deleteStock(int id) async {
    final stocksDB = await Hive.openBox<StockModel>('savedStocks_db');
    await stocksDB.deleteAt(id);
    getAllStocks();
  }
}
