import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/product_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/utils/pagination_helper.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';
import 'package:drift/drift.dart' as drift;

class ProductController extends GetxController {
  final productRep = Get.find<ProductRepository>();
  final listProduct = <ProductData>[].obs;
  final listCategory = <CategoryData>[].obs;
  final listPag = <ProductData>[].obs;
  final searchText = TextEditingController().obs;
  final scroll = ScrollController().obs;
  late PaginationHelper<ProductData> paginator;

  void loadAll() async {
    final data = await productRep.loadAllProduct();
    listProduct.assignAll(data['product']);
    listCategory.assignAll(data['category']);
    listPag.assignAll(data['product']);

    paginator = PaginationHelper(
      fullList: listProduct, 
      itemsPerPage: 20,
      filterFunc: (p0, p1) => p0.nama.toLowerCase().contains(p1.toLowerCase()),
      );

    listPag.value = paginator.loadMore();
  }

  void popUpProduct(ProductData? data) async {
    final RxInt categoryId = (data?.categoryId ?? 0).obs;
    final nama = TextEditingController(text: data?.nama ?? "");
    final stock = TextEditingController(text: data?.stock.toString() ?? "0");
    final harga = TextEditingController(text: data?.harga.toString() ?? "0");
    final description = TextEditingController(text: data?.description ?? "-");

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 16),
                Text(
                  data == null ? "Tambah Produk" : "Edit Produk",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Components.myTextField(
                  controller: nama,
                  label: 'Nama Produk',
                ),
                const SizedBox(height: 12),
                Obx(() => DropdownButtonFormField<int>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Kategori",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: listCategory
                              .any((cat) => cat.id == categoryId.value)
                          ? categoryId.value
                          : null, // <--- tambahkan validasi ini
                      items: listCategory.map((cat) {
                        return DropdownMenuItem<int>(
                          value: cat.id,
                          child: Text(cat.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          categoryId.value = val;
                        }
                      },
                    )),
                const SizedBox(height: 12),
                Components.myTextField(
                  controller: stock,
                  label: 'Stock',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                Components.myTextField(
                  controller: harga,
                  label: 'Harga',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                Components.myTextField(
                  controller: description,
                  label: 'Deskripsi',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (data != null)
                      Expanded(
                        child: Components.myButton(
                          'Hapus',
                          () async {
                            await productRep.deleteProduct(data.id);
                            loadAll();
                            Get.back();
                          },
                          color: Colors.redAccent,
                        ),
                      ),
                    if (data != null) const SizedBox(width: 8),
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
                          double newHarga = double.parse(harga.text.trim());
                          int newStock = int.parse(stock.text.trim());

                          if (data == null) {
                            await productRep.createProduct(
                              nama: nama.text.trim(),
                              harga: newHarga,
                              stock: newStock,
                              categpryId: categoryId.value,
                              description: description.text.trim(),
                            );
                          } else {
                            final newData = data.copyWith(
                              nama: nama.text.trim(),
                              harga: newHarga,
                              stock: newStock,
                              categoryId: drift.Value(categoryId.value),
                              description: drift.Value(description.text.trim()),
                            );
                            await productRep.updateProduct(newData);
                          }

                          loadAll();
                          Get.back();
                        },
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void search(String query) {
    paginator.search(query);
    listPag.value = paginator.loadMore();
  }
}
