import 'package:drift/drift.dart';
import 'category.dart';
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';

class Product extends Table {
  @override
  String get tableName => 'product';
  TextColumn get id => text().clientDefault(()=> uuidGenerate())();
  IntColumn get categoryId => integer().nullable().references(Category, #id)();
  TextColumn get nama => text()();
  IntColumn get stock => integer().withDefault(const Constant(0))();
  RealColumn get harga => real()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}