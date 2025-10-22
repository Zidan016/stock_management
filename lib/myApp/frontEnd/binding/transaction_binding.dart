import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/product_repository.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_item_repository.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/transaction/transaction_controller.dart';

class TransactionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> TransactionRepository(), fenix: true);
    Get.lazyPut(()=> TransactionItemRepository(), fenix: true);
    Get.lazyPut(()=> ProductRepository(), fenix: true);
    Get.lazyPut(()=> TransactionController(), fenix: true);
  }
}