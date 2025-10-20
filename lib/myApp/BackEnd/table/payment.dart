import 'package:drift/drift.dart';

class Payment extends Table{
  @override
  String get tableName => 'payment';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}