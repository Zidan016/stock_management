import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/product_category.dart';
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

    final result = product.map((itm) {
      final categories = category.firstWhereOrNull(
        (cat) => cat.id == itm.categoryId,
      );

      return ProductCategory(
          product: itm,
          category: categories ??
              CategoryData(
                  id: 0,
                  name: 'Tidak ada Kategori',
                  createdAt: DateTime.now()));
    }).toList();

    return result;
  }

  Future createProduct(String nama, double harga, String? description,
      int? categpryId, int stock) async {
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
}
