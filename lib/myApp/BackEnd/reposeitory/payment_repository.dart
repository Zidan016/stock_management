import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;

class PaymentRepository {
  final db = Get.find<DbService>();

  Future loadAll()async{
    final data = await (db.select(db.payment)..orderBy([(t)=> drift.OrderingTerm.desc(t.createdAt)])).get();
    return data;
  }

  Future create(String name)async{
    try {
      await db.into(db.payment).insert(PaymentCompanion.insert(name: name));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future update(PaymentData data)async{
    try {
      await (db.update(db.payment)..where((tbl) => tbl.id.equals(data.id),)).write(PaymentCompanion(name: drift.Value(data.name)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future delete(int id)async{
    try {
      await (db.delete(db.payment)..where((tbl) => tbl.id.equals(id),)).go();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}