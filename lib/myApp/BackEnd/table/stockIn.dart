import 'package:drift/drift.dart';
// ignore: unused_import
import 'stock.dart';

class Stockin extends Table {
  TextColumn get id => text()();
  TextColumn get stockId => text().customConstraint('REFERENCES stock(id)').nullable()();
  IntColumn get stock => integer()();
  DateTimeColumn get date => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}