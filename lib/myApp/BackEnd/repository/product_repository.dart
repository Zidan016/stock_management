import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;

class ProductRepository {
  final db = Get.find<DbService>();

  Future loadAllProduct() async {
    final product = await (db.select(db.product)
          ..orderBy([
            (t) => drift.OrderingTerm.desc(t.createdAt),
          ]))
        .get();
    final category = await db.select(db.category).get();

    return {'product': product, 'category': category};
  }

  Future createProduct({required String nama, required double harga, String? description,
      int? categpryId, required int stock}) async {
    try {
      await db.into(db.product).insert(ProductCompanion.insert(
          nama: nama,
          harga: harga,
          description: drift.Value(description),
          categoryId: drift.Value(categpryId),
          stock: drift.Value(stock)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future updateProduct(ProductData data) async {
    try {
      final respone = await (db.update(db.product)
            ..where((tbl) => tbl.id.equals(data.id)))
          .write(ProductCompanion(
        categoryId: drift.Value(data.categoryId),
        description: drift.Value(data.description),
        harga: drift.Value(data.harga),
        nama: drift.Value(data.nama),
        stock: drift.Value(data.stock),
      ));
      return respone > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future deleteProduct(String id) async {
    try {
      await (db.delete(db.product)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .go();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future byId(String id)async{
    final data = await (db.select(db.product)..where((tbl)=> tbl.id.equals(id))).getSingle();
    return data;
  }
}
