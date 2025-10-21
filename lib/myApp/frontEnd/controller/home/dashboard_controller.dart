import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/reposeitory/transaction_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';

class DashboardController extends GetxController{
  final transactionRepository = Get.find<TransactionRepository>();
  final transactionData = <Transaction>[].obs;
  final countTransactionPending = 0.obs;
  final countTransactionDone = 0.obs;

  void loadAll()async{
    final data = await transactionRepository.loadAllTransaction();
    transactionData.assignAll(data); 
    final transactionPending = transactionData.where((itm)=> itm.isPending == true);
    countTransactionPending.value = transactionPending.length;
    final transactionDone = transactionData.where((itm)=> itm.isPending == false);
    countTransactionDone.value = transactionDone.length;
    // print('Data : ${data}'+'Pending: ${countTransactionPending.value}'+ 'Done : ${countTransactionPending.value}');
  }


}