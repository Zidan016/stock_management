import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/dashboard_controller.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/home_controller.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/master_controller.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/transaction_home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController(), fenix: true);
    Get.lazyPut(()=> TransactionRepository(), fenix: true);
    Get.lazyPut(()=> DashboardController(), fenix: true);
    Get.lazyPut(()=> MasterController(), fenix: true);
    Get.lazyPut(()=> TransactionRepository(), fenix: true);
    Get.lazyPut(()=> TransactionHomeController(), fenix: true);
  }
}