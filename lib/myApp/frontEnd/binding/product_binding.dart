import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/product_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/master/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ProductRepository(), fenix: true);
    Get.lazyPut(()=> ProductController(), fenix: true);
  }

}