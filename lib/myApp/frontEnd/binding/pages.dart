import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/binding/category_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/home_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/initial_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/payment_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/product_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/transaction_binding.dart';
import 'package:pos_app/myApp/frontEnd/binding/transaction_detail_binding.dart';
import 'package:pos_app/myApp/frontEnd/views/home/home_view.dart';
import 'package:pos_app/myApp/frontEnd/views/initial_view.dart';
import 'package:pos_app/myApp/frontEnd/views/master/category_view.dart';
import 'package:pos_app/myApp/frontEnd/views/master/payment_view.dart';
import 'package:pos_app/myApp/frontEnd/views/master/product_view.dart';
import 'package:pos_app/myApp/frontEnd/views/transaction/transaction_detail_view.dart';
import 'package:pos_app/myApp/frontEnd/views/transaction/transaction_view.dart';

class Pages {
  static final routes = [
    GetPage(
        name: '/initial',
        page: () => const InitialView(),
        binding: InitialBinding()),
    GetPage(
        name: '/home', page: () => const HomeView(), binding: HomeBinding()),
    GetPage(
        name: '/category',
        page: () => const CategoryView(),
        binding: CategoryBinding()),
    GetPage(
        name: '/payment',
        page: () => const PaymentView(),
        binding: PaymentBinding()),
    GetPage(
        name: '/product',
        page: () => const ProductView(),
        binding: ProductBinding()),
    GetPage(
        name: '/transaction',
        page: () => const TransactionView(),
        binding: TransactionBinding()),
    GetPage(
        name: '/transaction/detail',
        page: () => const TransactionDetailView(),
        binding: TransactionDetailBinding())
  ];
}
