import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:stock_management/myApp/BackEnd/table/stock.dart';
import 'package:stock_management/myApp/BackEnd/table/stockIn.dart';
import 'package:stock_management/myApp/BackEnd/table/stockOut.dart';

part 'dbHelper.g.dart';

@DriftDatabase(tables: [Stock, Stockin, Stockout])
class Dbhelper extends _$Dbhelper{
  Dbhelper() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(){
    return driftDatabase(name: 'db_stock.db');
  }
}