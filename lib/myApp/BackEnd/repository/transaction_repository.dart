import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';

class TransactionRepository {
  final db = Get.find<DbService>();

  Future loadAllTransaction({
    int? paymentId,
    bool? isPending,
    DateTime? start,
    DateTime? end,
  }) async {
    final now = DateTime.now();
    start ??= DateTime(now.year, now.month, now.day, 0, 0, 0);
    end ??= DateTime(now.year, now.month, now.day, 23, 59, 59);

    final query = db.select(db.transactions)
      ..where(
        (t) =>
            t.createdAt.isBiggerOrEqualValue(start!) &
            t.createdAt.isSmallerOrEqualValue(end!),
      )
      ..orderBy([(t) => drift.OrderingTerm.desc(t.createdAt)]);

    if (paymentId != null) {
      query.where((t) => t.paymentId.equals(paymentId));
    }

    if (isPending != null) {
      query.where((t) => t.isPending.equals(isPending));
    }

    final payment = await db.select(db.payment).get();

    final result = await query.get();
    return {"result": result, "payment": payment};
  }

  Future toPdf(DateTime start, DateTime end)async{
    final transactionItem = await (db.select(db.transactionItem)
          ..where(
            (tbl) => tbl.createdAt.isBiggerOrEqualValue(start) & tbl.createdAt.isSmallerOrEqualValue(end),
          )
          ..orderBy([(t) => drift.OrderingTerm.desc(t.createdAt)]))
        .get();

    final productIds = transactionItem
        .map((i) => i.productId)
        .whereType<String>() 
        .toSet();
        
    final products = await (db.select(db.product)
          ..where((tbl) => tbl.id.isIn(productIds)))
        .get();

    final result = transactionItem.map((item) {
      final product = products.firstWhere((p) => p.id == item.productId,
          orElse: () => ProductData(
              id: "-",
              nama: 'Produk tidak ditemukan / Produk Telah Terhapus',
              harga: 0,
              description: 'Produk telah dihapus',
              categoryId: null,
              createdAt: DateTime.now(),
              stock: 0));

      return TransactionProductModel(
        transactionItemData: item,
        productData: product,
      );
    }).toList();

    return result;

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
        .getSingle();
    final product = await (db.select(db.product)
          ..orderBy([(it) => drift.OrderingTerm.desc(it.createdAt)]))
        .get();
    final payment = await (db.select(db.payment)
          ..orderBy([(it) => drift.OrderingTerm.desc(it.createdAt)]))
        .get();
    return {"transaction": data, "product": product, "payment": payment};
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
              totalRefund: drift.Value(data.totalRefund)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future delete(String id) async {
    try {
      await (db.delete(db.transactions)..where((tbl) => tbl.id.equals(id)))
          .go();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
