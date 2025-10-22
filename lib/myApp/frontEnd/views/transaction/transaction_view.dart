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
      controller.getaArgument();
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
            body: Obx(
              () => Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Components.myTextField(
                          controller: controller.customerText.value,
                          label: 'Customer',
                          ),
                      const SizedBox(
                        height: 5,
                      ),
                      Components.myTextField(
                          controller: controller.totalBayar.value,
                          label: 'Total Bayar',
                          keyboardType: TextInputType.number,
                          suffixIcon: Icons.save,
                          onIconPressed: () {
                            controller.updateTransaction(true);
                          },
                        ),
                          
                      const SizedBox(
                        height: 5,
                      ),
                      Components.textContentSmall('Total Harga : ${controller.mTransaction.value?.totalPrice ?? 0}'),
                      const SizedBox(height: 5,),

                      Components.textContentSmall('Total Kembali : ${controller.mTransaction.value?.totalRefund ?? 0}'),
                      const SizedBox(height: 5,),

                      DropdownButtonFormField<int>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: "Jenis Pembayaran",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        value: controller.listPayment
                                .any((cat) => cat.id == controller.paymnetId.value)
                            ? controller.paymnetId.value
                            : null,
                        items: controller.listPayment.map((cat) {
                          return DropdownMenuItem<int>(
                            value: cat.id,
                            child: Text(cat.name),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            controller.paymnetId.value = val;
                            print(controller.paymnetId.value);
                          }
                        },
                      ),
                      const SizedBox(height: 5,),
                      
                      Row(
                        children: [
                          Components.textContentSmall('Items'),
                          const Spacer(),
                          Expanded(child: Components.myButton('Edit', (){
                            controller.selectProduct();
                          },
                          color: Colors.grey))
                          
                        ],
                      ),
                      const SizedBox(height: 3,),
                      SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listTransactionItem.length,
                        itemBuilder: (context, index) {
                          final data = controller.listTransactionItem[index];
                          return Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.productData.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text('Qty: ${data.transactionItemData.qty}'),
                                Text(
                                    'Harga: Rp ${data.transactionItemData.price.toStringAsFixed(0)}'),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 5,),
                    Components.myButton('Check Out', (){controller.checkOut();})
                    ],
                  ),
                ),
              ),
            )));
  }
}
