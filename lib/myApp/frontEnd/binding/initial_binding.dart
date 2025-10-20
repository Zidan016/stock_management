import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/initial_service.dart';
import 'package:pos_app/myApp/frontEnd/controller/initial/initial_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> InitialService());
    Get.lazyPut(()=> InitialController());
  }
}