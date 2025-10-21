import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/category_repository.dart';
import 'package:pos_app/myApp/frontEnd/controller/master/category_controller.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> CategoryRepository(), fenix: true);
    Get.lazyPut(()=> CategoryController(), fenix: true);
  }
}