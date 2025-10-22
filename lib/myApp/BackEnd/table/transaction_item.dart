import 'package:drift/drift.dart';
import 'package:pos_app/myApp/BackEnd/table/product.dart';
import 'package:pos_app/myApp/BackEnd/table/transaction.dart';
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';

class TransactionItem extends Table{
  @override
  String get tableName => 'transaction_item';
  TextColumn get id => text().clientDefault(()=> uuidGenerate())();
  TextColumn get productId => text().nullable().references(Product, #id)();
  TextColumn get transactionId => text().nullable().references(Transactions, #id)();
  IntColumn get qty => integer().withDefault(const Constant(1))();
  RealColumn get price => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}