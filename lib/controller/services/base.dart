import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_watchlist/model/stock_model.dart';

typedef STOCKLIST = List<StockModel>;

class Services {
  Future<List<StockModel>> searchStock(String keyword) async {
    List<StockModel> stockList = [];
    // var uri = Uri.parse(
    //     "${baseApi}query?function=SYMBOL_SEARCH&keywords=T$keyword&apikey=$apiKey");
    var uri = Uri.parse(
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tesco&apikey=demo");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          final stocks = List<Map<String, dynamic>>.from(data['bestMatches']);
          stockList = stocks.map((e) => StockModel.fromJson(e)).toList();
        }
      } else {
        debugPrint("Error $response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return stockList;
  }

  Future<String> getPrice(String company) async {
    String price = "";
    // var uri = Uri.parse(
    //     "${baseApi}query?function=GLOBAL_QUOTE&symbol=$company&apikey=$apiKey");
    var uri = Uri.parse(
        "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        if (result['Global Quote'] != null) {
          final globalQuoteData = result['Global Quote'];
          price = globalQuoteData['05. price'];
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return price;
  }
}
