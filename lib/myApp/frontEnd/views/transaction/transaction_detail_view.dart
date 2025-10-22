import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pos_app/myApp/frontEnd/controller/transaction/transaction_detail_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.loadAll();
    });
    final receiptWidget = controller.buildReceiptWidget();

    return Scaffold(
      appBar: GFAppBar(
        title: const Text('Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(
              () => TextField(
                controller: controller.namaToko.value,
                decoration: const InputDecoration(
                  labelText: 'Nama Toko',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => TextField(
                controller: controller.alamat.value,
                decoration: const InputDecoration(
                  labelText: 'Alamat Toko',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Components.myButton(
                    'Export PDF',
                    () => controller.toPdf(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Components.myButton(
                    'Print Thermal',
                    () async => await controller.printThermal(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.listTransactionItem.isEmpty) {
                  return const Center(child: Text('Belum ada item'));
                }
                return ListView.builder(
                  itemCount: controller.listTransactionItem.length,
                  itemBuilder: (context, index) {
                    final item = controller.listTransactionItem[index];
                    return ListTile(
                      title: Text(item.productData.nama),
                      subtitle:
                          Text('Qty: ${item.transactionItemData.qty}'),
                      trailing: Text(
                          'Rp ${item.transactionItemData.price.toStringAsFixed(0)}'),
                    );
                  },
                );
              }),
            ),
            Offstage(child: receiptWidget),
          ],
        ),
      ),
    );
  }
}
