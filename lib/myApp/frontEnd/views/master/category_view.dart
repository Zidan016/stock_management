import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pos_app/myApp/frontEnd/controller/master/category_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.loadAllCategory();
    });

    return Obx(()=> Scaffold(
      appBar: GFAppBar(
        title: const Text('Kategori'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.popUpCategory(null);
      }, child: const Icon(Icons.add_box),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
                itemCount: controller.listCategory.length,
                itemBuilder: (context, index) {
                  final data = controller.listCategory[index];
                  return InkWell(
                    onTap: (){
                      controller.popUpCategory(data);
                    },
                    child: Components.myCard(data.name, [], [], []),
                  );
                })),
        ),
      ),
    );
  }
}
