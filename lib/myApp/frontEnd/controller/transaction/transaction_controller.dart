import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionController extends GetxController{
  final transactionRep = Get.find<TransactionRepository>();
  final mTransaction = Rxn<Transaction>();

  void loadAll()async{
    final data = Get.arguments;
    mTransaction.value = data;
  }

  Future<bool> onBack() async {
    bool result = false;

    await Get.defaultDialog(
      title: 'Pending Data?',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Components.textContentSmall(
            'Transaksi belum selesai. Apakah anda ingin pending transaksi?',
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Components.myButton(
                  'Hapus',
                  () async {
                    await transactionRep.delete(mTransaction.value!.id);
                    result = true; 
                    Get.back();
                  },
                  color: AppTheme.secondaryRed
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Components.myButton(
                  'Batal',
                  () {
                    result = false; // batal keluar
                    Get.back();
                  },
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Components.myButton(
                  'Pending',
                  () async {
                    await transactionRep.update(mTransaction.value!);
                    result = true;
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
    );

    return result;
  }
}