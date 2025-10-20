import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/home_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/app_theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: GFAppBar(
            title: const Text('Mini Pos'),
            automaticallyImplyLeading: false,
          ),
          body: controller.pages[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.setIndex,
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white70,
              backgroundColor: AppTheme.primaryRed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Transaksi',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  label: 'Data Master',
                ),
              ]),
        ));
  }
}
