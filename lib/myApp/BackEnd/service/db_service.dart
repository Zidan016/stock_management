import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:stock_management/myApp/BackEnd/table/category.dart';
import 'package:stock_management/myApp/BackEnd/table/payment.dart';
import 'package:stock_management/myApp/BackEnd/table/product.dart';
import 'package:stock_management/myApp/BackEnd/table/transaction.dart';
import 'package:stock_management/myApp/BackEnd/table/transaction_item.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

part 'db_service.g.dart';

@DriftDatabase(tables: [Category, Payment, Transactions, Product, TransactionItem])
class DbService extends _$DbService {
  DbService() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: DriftNativeOptions(
        databaseDirectory: () async => (await getApplicationSupportDirectory()).path,
      ),
    );
  }
}
