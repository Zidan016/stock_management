import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/controller/initial/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Center(
        child: Text(controller.info.value)
      ),
    ));
  }
}
