import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/views/home/dashboard_view.dart';
import 'package:pos_app/myApp/frontEnd/views/home/master_view.dart';
import 'package:pos_app/myApp/frontEnd/views/home/transaction_home_view.dart';

class HomeController extends GetxController{
  final pages = const [DashboardView(), TransactionHomeView(), MasterView()];

  final currentIndex = 0.obs;

  void setIndex(int index){
    currentIndex.value = index;
  }
}