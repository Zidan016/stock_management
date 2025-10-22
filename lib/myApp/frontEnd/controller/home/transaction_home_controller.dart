import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/service/print_service.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionHomeController extends GetxController {
  final transactionRep = Get.find<TransactionRepository>();

  final printService = PrintService();
  final listTransaction = <Transaction>[].obs;
  final listPayment = <PaymentData>[].obs;
  final scrollController = ScrollController().obs;

  final startDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    0,
    0,
    0,
  ).obs;

  final endDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    23,
    59,
    59,
  ).obs;

  final paymentId = RxnInt();
  final isPending = RxnBool();

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  void loadAll() async {
    final data = await transactionRep.loadAllTransaction(
      start: startDate.value,
      end: endDate.value,
      paymentId: paymentId.value,
      isPending: isPending.value,
    );
    listTransaction.assignAll(data["result"]);
    listPayment.assignAll(data["payment"]);
  }

  void newTransaction() async {
    final data = await transactionRep.createTransaction();
    await Get.toNamed('/transaction', arguments: data)?.then((_) => loadAll());
  }

  void toTransaction(Transaction data) async {
    await Get.toNamed('/transaction', arguments: data)?.then((_) => loadAll());
  }

  void toDetail(Transaction data) async {
    Get.toNamed('/transaction/detail', arguments: data);
  }

  void toPdf() async {
    List<TransactionProductModel> data =
        await transactionRep.toPdf(startDate.value, endDate.value);
    if (data.isEmpty) {
      Components.showToast('Tidak ada data');
    } else {
      await printService.exportTransactionRange(
          data, startDate.value, endDate.value);
    }
  }

  void openFilterSheet() {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Filter Transaksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 219, 219, 219),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    child: Obx(() => ListTile(
                          title: Text(
                              "Mulai: ${startDate.value.toLocal().toString().split(' ')[0]}"),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: Get.context!,
                              initialDate: startDate.value,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) startDate.value = picked;
                          },
                        )),
                  )),
                  Expanded(
                      child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 219, 219, 219),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    child: Obx(() => ListTile(
                          tileColor: Colors.grey,
                          title: Text(
                              "Sampai: ${endDate.value.toLocal().toString().split(' ')[0]}"),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: Get.context!,
                              initialDate: endDate.value,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) endDate.value = picked;
                          },
                        )),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => DropdownButtonFormField<bool>(
                    value: isPending.value,
                    decoration: const InputDecoration(
                      labelText: "Status",
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: null, child: Text("Semua")),
                      DropdownMenuItem(
                          value: true, child: Text("Belum Selesai")),
                      DropdownMenuItem(value: false, child: Text("Selesai")),
                    ],
                    onChanged: (val) => isPending.value = val,
                  )),
              const SizedBox(height: 12),
              Obx(() => DropdownButtonFormField<int?>(
                    value: paymentId.value,
                    decoration: const InputDecoration(
                      labelText: "Jenis Pembayaran",
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      const DropdownMenuItem<int?>(
                        value: null,
                        child: Text("Semua"),
                      ),
                      ...listPayment.map((cat) {
                        return DropdownMenuItem<int?>(
                          value: cat.id,
                          child: Text(cat.name),
                        );
                      }),
                    ],
                    onChanged: (val) => paymentId.value = val,
                  )),
              const SizedBox(height: 16),
              Components.myButton('Terapkan', () {
                loadAll();
                Get.back();
              }),
              const SizedBox(height: 30,)
            ],
          ),
        ),
        isScrollControlled: true);
  }
}
