import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/dashboard_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAll();
    });

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Components.textHeadlineMedium(
                                    'Transaksi Selesai'),
                                const SizedBox(height: 8),
                                Text(
                                  controller.countTransactionDone.toString(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.outbond,
                                  color: Colors.indigo,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Components.textHeadlineMedium(
                                    'Transaksi Pending'),
                                const SizedBox(height: 8),
                                Text(
                                  controller.countTransactionPending.toString(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.pending_actions_outlined,
                                  color: Colors.redAccent,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Components.textContentMedium('Transaksi Terbaru'),
                const SizedBox(height: 5,),
                Expanded(
                  child: controller.transactionData.isEmpty
                      ? Center(
                          child:
                              Components.textLightSmall('Belum Ada Transaksi'),
                        )
                      : ListView.builder(
                          itemCount: controller.transactionData.length > 10 ? 10 : controller.transactionData.length,
                          itemBuilder: (context, index) {
                            final data = controller.transactionData[index];
                            return Components.myCard(
                              data.uniqeCode,
                              [
                                'Customer : ${data.customer ?? "-"}',
                                'Tanggal : ${data.createdAt.toIso8601String()}',
                                'Total Harga : ${data.totalPrice}',
                                'Status : ${data.isPending ? "Pending" : "Selesai"}'
                              ],
                              [Icons.info_rounded],
                              [() {}],
                            );
                          },
                        ),
                ),
              ],
            )),
      )),
    );
  }
}
