import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;

class TransactionItemRepository {
  final db = Get.find<DbService>();

  Future loadAll(String transactionId) async {
    final transactionItem = await (db.select(db.transactionItem)
          ..where(
            (tbl) => tbl.transactionId.equals(transactionId),
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

  Future create(
      double price, int qty, String productId, String transactionId) async {
    try {
      await db.into(db.transactionItem).insert(TransactionItemCompanion.insert(
          price: drift.Value(price),
          productId: drift.Value(productId),
          transactionId: drift.Value(transactionId),
          qty: drift.Value(qty)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future update(TransactionItemData data) async {
    try {
      await db.update(db.transactionItem)
        ..where((tbl) => tbl.id.equals(data.id))
        ..write(TransactionItemCompanion(
            price: drift.Value(data.price),
            productId: drift.Value(data.productId),
            transactionId: drift.Value(data.transactionId),
            qty: drift.Value(data.qty)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future delete(String id) async {
    try {
      await (db.delete(db.transactionItem)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .go();
      return true;
    } catch (e) {
      return false;
    }
  }
}
