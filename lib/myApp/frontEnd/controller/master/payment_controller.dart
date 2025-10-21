import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/payment_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class PaymentController extends GetxController{
  final paymentRep = Get.find<PaymentRepository>();
  final listPayment = <PaymentData>[].obs;

  void loadAll() async {
    final data = await paymentRep.loadAll();
    listPayment.assignAll(data);
  }

  void popUpCategory(PaymentData? data) {
    final nameController = TextEditingController(text: data?.name ?? '');

    Get.defaultDialog(
      title: data == null ? "Buat Payment" : "Edit Payment",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Components.myTextField(controller: nameController, label: 'Payment'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Components.myButton(
                  'Simpan',
                  () async {
                    final name = nameController.text.trim();
                    if (name.isEmpty) return;

                    if (data == null) {
                      await paymentRep.create(name);
                    } else {
                      final newData = data.copyWith(name: name);
                      await paymentRep.update(newData);
                    }

                    loadAll();
                    Get.back();
                  },
                  color: Colors.indigoAccent,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Components.myButton(
                  'Batal',
                  textColor: Colors.black87,
                  () {
                    Get.back();
                  },
                  color: Colors.grey,
                ),
              ),
              if (data != null) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: Components.myButton(
                    'Hapus',
                    () async {
                      await paymentRep.delete(data.id);
                      loadAll();
                      Get.back();
                    },
                    color: AppTheme.secondaryRed,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}