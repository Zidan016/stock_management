import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/binding/category_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/home_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/initial_binding.dart';
import 'package:pos_app/myApp/frontEnd/views/home/home_view.dart';
import 'package:pos_app/myApp/frontEnd/views/initial_view.dart';
import 'package:pos_app/myApp/frontEnd/views/master/category_view.dart';

class Pages {
  static final routes = [
    GetPage(
      name: '/initial', 
      page: ()=> const InitialView(),
      binding: InitialBinding()
    ),

    GetPage(
      name: '/home', 
      page: ()=> const HomeView(),
      binding: HomeBinding()
    ),

    GetPage(
      name: '/category', 
      page: ()=> const CategoryView(),
      binding: CategoryBinding()
    )
  ];
}