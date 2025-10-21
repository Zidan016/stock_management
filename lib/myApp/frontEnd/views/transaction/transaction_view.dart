import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pos_app/myApp/frontEnd/controller/transaction/transaction_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAll();
    });
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          return await controller.onBack();
        },
        child: Scaffold(
          appBar: GFAppBar(
            title: Text('Transaksi'),
          ),
          body: Center(
            child: Components.textLightMedium('Coming Soon'),
          ),
        ));
  }
}
