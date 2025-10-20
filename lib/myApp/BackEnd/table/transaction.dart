import 'dart:math';

import 'package:drift/drift.dart';
import 'package:stock_management/myApp/BackEnd/table/payment.dart';
import 'package:uuid/uuid.dart';

String generateUniqueCode() {
  final random = Random();
  final randomDigits = List.generate(7, (_) => random.nextInt(10)).join();
  final date = DateTime.now();
  final dateStr =
      '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  return 'TR$randomDigits-$dateStr';
}

class Transactions extends Table{
  @override
  String get tableName => 'transaction';
  TextColumn get id => text().clientDefault(()=> const Uuid().v4())();
  TextColumn get uniqeCode => text().clientDefault(()=> generateUniqueCode())();
  IntColumn get paymentId => integer().nullable().references(Payment, #id)();
  TextColumn get customer => text().nullable()();
  RealColumn get totalPrice => real().withDefault(const Constant(0))();
  RealColumn get totalPaid => real().withDefault(const Constant(0))();
  RealColumn get totalRefund => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}