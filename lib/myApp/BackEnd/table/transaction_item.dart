import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();

class TransactionItem extends Table{
  @override
  String get tableName => 'transaction_item';
  TextColumn get id => text().clientDefault(()=> const Uuid().v4())();
  TextColumn get productId => text().customConstraint('REFERENCES product(id)').nullable()();
  TextColumn get transactionId => text().customConstraint('REFERENCES transaction(id)').nullable()();
  IntColumn get qty => integer().withDefault(const Constant(1))();
  RealColumn get price => real().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}