import 'package:drift/drift.dart';

class Stock extends Table{
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get stok => integer()();

  @override
  Set<Column> get primaryKey => {id};
}