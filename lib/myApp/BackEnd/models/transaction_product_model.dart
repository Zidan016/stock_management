import 'package:pos_app/myApp/BackEnd/service/db_service.dart';

class TransactionProductModel {
  final TransactionItemData transactionItemData;
  final ProductData productData;

  TransactionProductModel({required this.transactionItemData, required this.productData});
}