import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';

class CategoryRepository {
  final db = Get.find<DbService>();

  Future loadCatageory() async {
    final products = await db.select(db.category);
    return products;
  }

  Future addCategory(String name) async {
    try {
      await db.into(db.category).insert(CategoryCompanion.insert(name: name));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future editCategory(CategoryData category) async {
    try {
      await (db.update(db.category)..where((tbl) => tbl.id.equals(category.id)))
          .write(category);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future deleteCategoru(int id) async {
    try {
      await (db.delete(db.category)..where((tbl) => tbl.id.equals(id))).go;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
