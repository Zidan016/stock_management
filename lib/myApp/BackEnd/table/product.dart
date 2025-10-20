import 'package:drift/drift.dart';
// ignore: unused_import
import 'category.dart';
import 'package:uuid/uuid.dart';

class Product extends Table {
  @override
  String get tableName => 'product';
  TextColumn get id => text().clientDefault(()=> const Uuid().v4())();
  IntColumn get categoryId => integer().customConstraint('REFERENCES category(id)').nullable()();
  TextColumn get nama => text()();
  IntColumn get stock => integer().withDefault(const Constant(0))();
  RealColumn get harga => real()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}