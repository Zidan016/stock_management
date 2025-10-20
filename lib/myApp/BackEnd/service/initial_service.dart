import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:drift/drift.dart' as drift;

class InitialService {
  final db = Get.find<DbService>();

  Future<bool> init() async {
    try {
      await db.into(db.category).insert(CategoryCompanion.insert(name: 'Pakaian'));
      await db.into(db.category).insert(CategoryCompanion.insert(name: 'Celana'));
      await db.into(db.payment).insert(PaymentCompanion.insert(name: 'Cash'));

      await db.into(db.product).insert(
        ProductCompanion.insert(
          nama: 'Baju Distro',
          harga: 35000,
          categoryId: const drift.Value(1),
          description: const drift.Value('baju distro ori'),
          stock: const drift.Value(10),
        ),
      );

      return true;
    } catch (e) {
      print('Error init data: $e');
      return false;
    }
  }

  Future<bool> check() async {
    final categoryCount = await db.select(db.category).get();
    final paymentCount = await db.select(db.payment).get();
    final productCount = await db.select(db.product).get();

    if (categoryCount.isEmpty && paymentCount.isEmpty && productCount.isEmpty) {
      return await init();
    } else {
      return false;
    }
  }
}

