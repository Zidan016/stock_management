import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_item_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/transaction/transaction_detail_controller.dart';

class TransactionDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> TransactionItemRepository(), fenix: true);
    Get.lazyPut(()=> TransactionDetailController(), fenix: true);
  }

}