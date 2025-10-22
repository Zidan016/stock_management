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

  void loadAll()async{
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
    _receiptWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(namaToko.value.text,
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Center(child: Text(alamat.value.text)),
        const SizedBox(height: 5),
        Text('Customer : ${mTransaction.value?.customer ?? "-"}'),
        const SizedBox(height: 5,),
        ...listTransactionItem.map((item) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${item.productData.nama} x${item.transactionItemData.qty}"),
                Text("Rp ${item.transactionItemData.price.toStringAsFixed(0)}"),
              ],
            )),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("TOTAL", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "Rp ${mTransaction.value?.totalPaid.toStringAsFixed(0) ?? '0'}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Dibayar:"),
            Text("Rp ${mTransaction.value?.totalPaid.toStringAsFixed(0) ?? '0'}"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Kembali:"),
            Text(
                "Rp ${mTransaction.value?.totalRefund.toStringAsFixed(0) ?? '0'}"),
          ],
        ),
        const SizedBox(height: 10),
        const Center(child: Text("Terima kasih")),
      ],
    );

    return Receipt(
      builder: (context) => _receiptWidget!,
      onInitialized: (controller) {
        _receiptController = controller;
      },
    );
  }
}
