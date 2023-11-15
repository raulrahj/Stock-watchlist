import 'package:hive_flutter/hive_flutter.dart';
part 'stock_model.g.dart';
@HiveType(typeId: 0)
class StockModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String company;
  @HiveField(2)
  final String symbol;

  StockModel({this.id, required this.company, required this.symbol});
  
  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      company: json['company'] ?? "",
      symbol: json['symbol'] ?? "",
    );
  }
}
