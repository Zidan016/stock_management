import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';

class TransactionRepository {
  final db = Get.find<DbService>();

  Future loadAllTransaction() async {
    final transaction = await (db.select(db.transactions)
          ..orderBy([
            (t) => drift.OrderingTerm.desc(t.createdAt),
          ]))
        .get();
    return transaction;
  }

  Future createTransaction() async {
    try {
      final id = uuidGenerate();
      await db
          .into(db.transactions)
          .insert(TransactionsCompanion.insert(id: drift.Value(id)));
      final data = await (db.select(db.transactions)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingle();
      return data;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future byId(String id) async {
    final data = await (db.select(db.transactions)
          ..where((tbl) => tbl.id.equals(id)))
        .get();
    return data;
  }

  Future update(Transaction data) async {
    try {
      await (db.update(db.transactions)
            ..where(
              (tbl) => tbl.id.equals(data.id),
            ))
          .write(TransactionsCompanion(
        isPending: drift.Value(data.isPending),
        customer: drift.Value(data.customer),
        paymentId: drift.Value(data.paymentId),
        totalPaid: drift.Value(data.totalPaid),
        totalPrice: drift.Value(data.totalPrice),
        totalRefund: drift.Value(data.totalRefund)
      ));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future delete(String id)async{
    try {
      await (db.delete(db.transactions)..where((tbl) => tbl.id.equals(id))).go();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
