import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_printer/flutter_bluetooth_printer_library.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_item_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/service/print_service.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionDetailController extends GetxController {
  final repTransactionItem = Get.find<TransactionItemRepository>();
  final listTransactionItem = <TransactionProductModel>[].obs;
  final mTransaction = Rxn<Transaction>();
  final namaToko = TextEditingController().obs;
  final alamat = TextEditingController().obs;
  final printService = PrintService();

  ReceiptController? _receiptController;
  Widget? _receiptWidget;

  void loadAll() async {
    Transaction model = Get.arguments;
    mTransaction.value = model;

    final dataList = await repTransactionItem.loadAll(model.id);
    listTransactionItem.assignAll(dataList);
  }

  void toPdf() async {
    if (alamat.value.text.isEmpty || namaToko.value.text.isEmpty) {
      Components.showToast('Nama / Alamat tidak boleh kosong');
      return;
    }

    if (mTransaction.value == null) {
      Components.showToast('Data transaksi kosong');
      return;
    }

    await printService.exportThermalStruk(
      listTransactionItem,
      mTransaction.value!,
      namaToko.value.text,
      alamat.value.text,
    );
  }

  Future<void> printThermal(BuildContext context) async {
    if (alamat.value.text.isEmpty || namaToko.value.text.isEmpty) {
      Components.showToast('Nama / Alamat tidak boleh kosong');
      return;
    }

    if (_receiptController == null) {
      Components.showToast('Receipt controller belum siap');
      return;
    }

    final device = await FlutterBluetoothPrinter.selectDevice(context);
    if (device == null) {
      Components.showToast('Tidak ada printer dipilih');
      return;
    }

    await _receiptController?.print(address: device.address);
  }

  Widget buildReceiptWidget() {
    return Obx(() {
      final transaction = mTransaction.value;
      final items = listTransactionItem;

      _receiptWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo toko / nama toko
          Center(
            child: Text(
              namaToko.value.text.isNotEmpty ? namaToko.value.text : "-",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Center(
            child: Text(
              alamat.value.text.isNotEmpty ? alamat.value.text : "-",
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),

          // Customer
          Row(
            children: [
              const Text(
                "Customer: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              Text(transaction?.customer ?? "-"),
            ],
          ),
          const SizedBox(height: 8),

          // List transaksi
          ...items.map((item) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6), // jarak antar item
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${item.productData.nama} x${item.transactionItemData.qty}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(
                      "Rp ${item.transactionItemData.price.toStringAsFixed(0)}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )),

          const Divider(thickness: 1),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("TOTAL",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                "Rp ${transaction?.totalPaid.toStringAsFixed(0) ?? '0'}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Dibayar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dibayar:"),
              Text("Rp ${transaction?.totalPaid.toStringAsFixed(0) ?? '0'}"),
            ],
          ),
          const SizedBox(height: 2),

          // Kembali
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Kembali:"),
              Text("Rp ${transaction?.totalRefund.toStringAsFixed(0) ?? '0'}"),
            ],
          ),
          const SizedBox(height: 12),

          // Footer
          const Center(
            child: Text(
              "Terima kasih",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );

      return Receipt(
        builder: (context) => _receiptWidget!,
        onInitialized: (controller) {
          _receiptController = controller;
        },
      );
    });
  }
}
