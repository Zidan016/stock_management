import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class CategoryRepository {
  final db = Get.find<DbService>();

  Future loadCatageory() async {
    final products = await db.select(db.category).get();
    return products;
  }

  Future addCategory(String name) async {
    try {
      await db.into(db.category).insert(CategoryCompanion.insert(name: name));
      Components.showToast('Berhasil Buat Category');
      return true;
    } catch (e) {
      Components.showToast('Gaga Buat Category');
      print(e);
      return false;
    }
  }

  Future editCategory(CategoryData category) async {
    try {
      await (db.update(db.category)..where((tbl) => tbl.id.equals(category.id)))
          .write(category);
      Components.showToast('Berhasil Edit Category');
      return true;
    } catch (e) {
      Components.showToast('Gagal Edit Category');
      print(e);
      return false;
    }
  }

  Future deleteCategoru(int id) async {
    try {
      await (db.delete(db.category)..where((tbl) => tbl.id.equals(id))).go();
      // print(respone);
      Components.showToast('Berhasil Hapus Category');
      return true;
    } catch (e) {
      print(e);
      Components.showToast('Berhasil Hapus Category');
      return false;
    }
  }
}
