import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/reposeitory/category_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class CategoryController extends GetxController {
  final categoryRep = Get.find<CategoryRepository>();
  final listCategory = <CategoryData>[].obs;
  final mCategory = Rxn<CategoryData>();

  void loadAllCategory() async {
    final data = await categoryRep.loadCatageory();
    listCategory.assignAll(data);
  }

  void popUpCategory(CategoryData? data) {
    final nameController = TextEditingController(text: data?.name ?? '');

    Get.defaultDialog(
      title: data == null ? "Buat Kategori" : "Edit Kategori",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Components.myTextField(controller: nameController, label: 'Kategori'),
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
                      await categoryRep.addCategory(name);
                    } else {
                      final newData = data.copyWith(name: name);
                      await categoryRep.editCategory(newData);
                    }

                    loadAllCategory();
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
                      await categoryRep.deleteCategoru(data.id);
                      loadAllCategory();
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
