import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> HomeController(), fenix: true);
  }
}