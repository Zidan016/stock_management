import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/repository/product_repository.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_item_repository.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/utils/pagination_helper.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';
import 'package:drift/drift.dart' as drift;

class TransactionController extends GetxController {
  final transactionRep = Get.find<TransactionRepository>();
  final transactionItemRep = Get.find<TransactionItemRepository>();
  final productRep = Get.find<ProductRepository>();

  final mTransaction = Rxn<Transaction>();
  final listTransactionItem = <TransactionProductModel>[].obs;
  final listProduct = <ProductData>[].obs;
  final listPayment = <PaymentData>[].obs;

  late PaginationHelper<ProductData> paginator;

  final scrollController = ScrollController().obs;
  final searchCoontroller = TextEditingController().obs;
  final customerText = TextEditingController().obs;
  final totalBayar = TextEditingController().obs;
  final paymnetId = 0.obs;

  void getaArgument() {
    Transaction data = Get.arguments;
    mTransaction.value = data;
  }

  void loadAll() async {
    final updatedData = await transactionRep.byId(mTransaction.value!.id);
    mTransaction.value = updatedData['transaction'];
    List<ProductData> productData = updatedData['product'];
    listPayment.assignAll(updatedData['payment']);
    paymnetId.value = mTransaction.value!.paymentId ?? 0;

    final transactionItemData =
        await transactionItemRep.loadAll(mTransaction.value!.id);
    listTransactionItem.assignAll(transactionItemData);

    paginator = PaginationHelper(
      fullList: productData,
      itemsPerPage: 20,
      filterFunc: (p0, p1) => p0.nama.toLowerCase().contains(p1),
    );

    listProduct.assignAll(paginator.loadMore());
    customerText.value.text = mTransaction.value?.customer ?? "";
    totalBayar.value.text = mTransaction.value?.totalPaid.toString() ?? "0";
    paymnetId.value = mTransaction.value?.paymentId ?? 0;
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
                child: Components.myButton('Hapus', () async {
                  await transactionRep.delete(mTransaction.value!.id);
                  result = true;
                  Get.back();
                }, color: AppTheme.secondaryRed),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Components.myButton(
                  'Batal',
                  () {
                    result = false;
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
                    
                    await updateTransaction(true);
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

  void search(String query) {
    paginator.search(query);
    listProduct.assignAll(paginator.loadMore());
  }

  updateTransaction(bool isPending)async{
    double paid = totalBayar.value.text.isEmpty ? 0 : double.parse(totalBayar.value.text);
    double totalPrice = listTransactionItem
    .map((itm) => itm.transactionItemData.price)
    .fold(0, (prev, element) => prev + element);
    double totalRefund = paid > totalPrice ? paid - totalPrice : 0;

    final newTransaction = mTransaction.value?.copyWith(
      customer: drift.Value(customerText.value.text),
      paymentId: drift.Value(paymnetId.value == 0 ? null : paymnetId.value),
      isPending: isPending,
      totalPaid: paid,
      totalPrice: totalPrice,
      totalRefund: totalRefund,
    );
    await transactionRep.update(newTransaction!);
    loadAll();
  }

  updateStock(ProductData data, int newStock)async{
    final newProduct = data.copyWith(
      stock: newStock
    );
    await productRep.updateProduct(newProduct);
  }

  void selectProduct() async {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppTheme.backgroundWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: SafeArea(
          top: false,
          child: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Components.myTextField(
                    controller: searchCoontroller.value,
                    label: 'Cari Produk',
                    onChanged: (value) => search(value),
                  ),
                  const SizedBox(height: 10),
                  if (listTransactionItem.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Components.textLightSmall('Keranjang Saat Ini'),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listTransactionItem.length,
                        itemBuilder: (context, index) {
                          final data = listTransactionItem[index];
                          return Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.productData.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text('Qty: ${data.transactionItemData.qty}'),
                                Text(
                                    'Harga: Rp ${data.transactionItemData.price.toStringAsFixed(0)}'),
                                const Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () => editItem(data.productData),
                                    child: const Icon(Icons.edit,
                                        color: Colors.indigo, size: 20),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController.value,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: listProduct.length,
                      itemBuilder: (context, i) {
                        final p = listProduct[i];
                        return InkWell(
                          onTap: () {
                            if(p.stock == 0){
                              Components.showToast('Stok tidak cukup');
                            }else{
                              editItem(p);
                            }
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: const Icon(
                                        Icons.inventory_2_outlined,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    p.nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Stock: ${p.stock}",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Rp ${p.harga.toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void editItem(ProductData product) async {
    TransactionItemData? transactionItem = listTransactionItem
        .firstWhereOrNull(
            (it) => it.transactionItemData.productId == product.id)
        ?.transactionItemData;
    final qty =
        TextEditingController(text: transactionItem?.qty.toString() ?? "1");
    final hargaPerItem = TextEditingController(text: product.harga.toString());

    Get.defaultDialog(
        title: product.nama,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Components.myTextField(
                controller: qty,
                label: 'Qty',
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 5,
            ),
            Components.myTextField(
                controller: hargaPerItem,
                label: 'Harga Per Item',
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                if (transactionItem != null)
                  Expanded(
                    child: Components.myButton(
                      'Hapus',
                      () async {
                        await transactionItemRep.delete(transactionItem.id);
                        loadAll();
                        await Future.delayed(Duration(milliseconds: 500));
                        await updateTransaction(true);
                        loadAll();
                        Get.back();
                      },
                      color: Colors.redAccent,
                    ),
                  ),
                if (transactionItem != null) const SizedBox(width: 8),
                Expanded(
                  child: Components.myButton(
                    'Batal',
                    () => Get.back(),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Components.myButton(
                    'Simpan',
                    () async {
                      int newqty = int.parse(qty.text.trim());
                      if(newqty > product.stock){
                        Components.showToast('Stok Tidak Cukup');
                        return;
                      }
                      double newHarga = double.parse(hargaPerItem.text.trim());
                      double totalHarga = newHarga * newqty;
                      final newData = transactionItem?.copyWith(
                          transactionId: drift.Value(mTransaction.value!.id),
                          price: totalHarga,
                          productId: drift.Value(product.id),
                          qty: newqty);

                      print(newData);
                      if (transactionItem == null) {
                        await transactionItemRep.create(totalHarga, newqty,
                            product.id, mTransaction.value!.id);
                      } else {
                        await transactionItemRep.update(newData!);
                      }
                      loadAll();
                      await Future.delayed(const Duration(milliseconds: 500));
                      await updateTransaction(true);
                      loadAll();
                      Get.back();
                    },
                    color: Colors.indigoAccent,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void checkOut() async{
    Components.showLoading();
    await updateTransaction(true);
    await Future.delayed(const Duration(milliseconds: 500));
    loadAll();
    Components.hideLoading();
    if(paymnetId.value == 0){
      Components.showToast('Jenis Pembayaran Tidak Boleh Kosong');
    }else if(listTransactionItem.isEmpty){
      Components.showToast('Silahkan pilih produk terlebih dahulu');
    }else if(mTransaction.value!.totalPrice > mTransaction.value!.totalPaid){
      Components.showToast('Pembayaran Kurang');
    }else{
      Components.showLoading();
      for(var item in listTransactionItem){
        ProductData product = await productRep.byId(item.productData.id);
        final newStock = product.stock - item.transactionItemData.qty;
        final newProduct = product.copyWith(
          stock: newStock
        );
        await productRep.updateProduct(newProduct);
      }
      await updateTransaction(false);
      Components.hideLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();
      Components.showInfo('Transaksi Berhasil', 'Selamat Transaksi anda berhasil :)');
    }
  }
}
