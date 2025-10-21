import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/payment_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/master/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentRepository(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
  }
}
