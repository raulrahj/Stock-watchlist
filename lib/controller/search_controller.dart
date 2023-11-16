import 'package:flutter/material.dart';
import 'package:stock_watchlist/controller/services/base.dart';
import 'package:stock_watchlist/model/stock_model.dart';

class SearchController extends ChangeNotifier {
  final _service = Services();
  List<StockModel> searchSuggestions = [];
  List<StockModel> searchResult = [];
  bool isLoading = false;
  bool isSearch = false;
  Future<void> fetchData(String keyword, [bool isSearching = false]) async {
    isLoading = true;
    isSearch = false;
    searchResult.clear();
    searchSuggestions.clear();
    notifyListeners();
    final data = await _service.searchStock(keyword);
    if (isSearching) {
      isSearch = true;
      searchResult = data;
    } else {
      searchSuggestions = data;
    }
    isLoading = false;
    notifyListeners();
  }

  void clearSearch() {
    searchResult.clear();
    searchSuggestions.clear();
    notifyListeners();
  }
}
