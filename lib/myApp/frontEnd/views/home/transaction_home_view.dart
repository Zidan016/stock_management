import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/transaction_home_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionHomeView extends GetView<TransactionHomeController> {
  const TransactionHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAll();
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.newTransaction();
        },
        label: const Text('Baru'),
        icon: const Icon(Icons.add_box),
      ),
      body: Obx(()=>  Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              controller.listPaged.isEmpty
                  ? Center(
                      child: Components.textLightMedium('Belum ada transaksi'),
                    )
                  : Expanded(
                      child: ListView.builder(
                          controller: controller.scrollCOntroller.value,
                          itemCount: controller.listPaged.length,
                          itemBuilder: (context, index) {
                            final data = controller.listPaged[index];
                            return InkWell(
                              onTap: () {
                                controller.toTransaction(data);
                              },
                              child: Components.myCard(data.uniqeCode, [
                                'Tanggal : ${dateFormat(data.createdAt)}',
                                'Customer : ${data.customer ?? "-"}',
                                'Total Harga : ${data.totalPrice.toString()}',
                                'Status : ${data.isPending == true ? "Pending" : "Selesai"}'
                              ], [
                                Icons.info_outline,
                              ], [
                                () {
                                  
                                }
                              ]),
                            );
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
