import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/myApp/frontEnd/controller/home/master_controller.dart';
import 'package:pos_app/myApp/frontEnd/style/components.dart';

class MasterView extends GetView<MasterController> {
  const MasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildMenuCard(
                      icon: Icons.category, label: 'Kategori', onTap: () {controller.toCategory();}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildMenuCard(
                      icon: Icons.all_inbox_rounded,
                      label: 'Produk',
                      onTap: () {controller.toProduct();}),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildMenuCard(
                      icon: Icons.payment,
                      label: 'Pembayaran',
                      onTap: () {controller.toPayment();}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color.fromARGB(255, 220, 220, 220),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.indigo, size: 36),
                const SizedBox(height: 8),
                Components.textHeadlineMedium(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
