import 'package:get/get.dart';

class MasterController extends GetxController{
  void toCategory(){
    Get.toNamed('/category');
  }

  void toPayment(){
    Get.toNamed('/payment');
  }
  
  void toProduct(){
    Get.toNamed('/product');
  }
}