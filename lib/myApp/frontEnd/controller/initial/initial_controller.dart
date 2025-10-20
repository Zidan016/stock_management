import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/service/initial_service.dart';

class InitialController extends GetxController {
  final service = Get.find<InitialService>();
  final info = 'Data belum terbuat'.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkData();
  }
  void checkData() async {
    final result = await service.check();
    if (result) {
      info.value = 'Data baru dibuat';
    } else {
      info.value = 'Data sudah dibuat';
    }
    print(info.value);
    await Future.delayed(Duration(seconds: 3));
    Get.toNamed('/home');
  }
}
