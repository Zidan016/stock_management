import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/BackEnd/repository/transaction_repository.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/utils/pagination_helper.dart';

class TransactionHomeController extends GetxController{
  final transactionRep = Get.find<TransactionRepository>();
  final listTransaction = <Transaction>[].obs;
  final listPaged = <Transaction>[].obs;
  final scrollCOntroller = ScrollController().obs;
  late PaginationHelper<Transaction> paginator;

  void loadAll()async{
    final data = await transactionRep.loadAllTransaction();
    listTransaction.assignAll(data);

    paginator = PaginationHelper(
      fullList: listTransaction,
      itemsPerPage: 20,
    );

    listPaged.assignAll(paginator.loadMore());
  }

  void newTransaction()async{
    final data = await transactionRep.createTransaction();
    await Get.toNamed('/transaction', arguments: data)?.then((_){loadAll();});
  }

  void toTransaction(Transaction data)async{
    await Get.toNamed('/transaction', arguments: data)?.then((_){loadAll();});
  }
}