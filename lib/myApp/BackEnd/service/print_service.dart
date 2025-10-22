import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pos_app/myApp/BackEnd/models/transaction_product_model.dart';
import 'package:pos_app/myApp/BackEnd/service/db_service.dart';
import 'package:pos_app/myApp/BackEnd/utils/utils.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

class PrintService {
  Future exportTransactionRange(
      List<TransactionProductModel> list, DateTime start, DateTime end) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return [
            pw.Text("Laporan Transaksi",
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Text('Tgl : ${dateFormat(start)} - ${dateFormat(end)}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: ['Nama Produk', 'Qty', 'Harga', 'Total'],
              data: list.map((item) {
                final total = item.transactionItemData.price;
                return [
                  item.productData.nama,
                  item.transactionItemData.qty.toString(),
                  item.transactionItemData.price.toStringAsFixed(0),
                  total.toStringAsFixed(0)
                ];
              }).toList(),
            )
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/transaksi.pdf');
    await file.writeAsBytes(await pdf.save());
    print("PDF tersimpan di: ${file.path}");
  }

  Future exportThermalStruk(List<TransactionProductModel> items,
      Transaction model, String namaToko, String alamatToko) async {
    final pdf = pw.Document();

    double totalPrice =
        items.fold(0, (sum, item) => sum + item.transactionItemData.price);

    pdf.addPage(
      pw.Page(
        pageFormat: const PdfPageFormat(58 * PdfPageFormat.mm, double.infinity,
            marginAll: 5 * PdfPageFormat.mm),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
              child: pw.Text(namaToko,
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
            ),
            pw.Center(
              child:
                  pw.Text(alamatToko, style: const pw.TextStyle(fontSize: 10)),
            ),
            pw.SizedBox(height: 5),
            pw.Row(children: [
              pw.Text('Customer:', style: const pw.TextStyle(fontSize: 8)),
              pw.SizedBox(width: 2),
              pw.Text(model.customer!, style: const pw.TextStyle(fontSize: 8))
            ]),
            pw.SizedBox(height: 10),
            ...items.map((item) => pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 4),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        child: pw.Text(
                            "${item.productData.nama}   x${item.transactionItemData.qty}",
                            style: const pw.TextStyle(fontSize: 7)),
                      ),
                      pw.Text(
                          "Rp ${item.transactionItemData.price.toStringAsFixed(0)}",
                          style: const pw.TextStyle(fontSize: 7)),
                    ],
                  ),
                )),
            pw.Divider(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("TOTAL",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text("Rp ${totalPrice.toStringAsFixed(0)}",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Dibayar:", style: const pw.TextStyle(fontSize: 10)),
                pw.Text("Rp ${model.totalPaid.toStringAsFixed(0)}",
                    style: pw.TextStyle(fontSize: 10)),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Kembali:", style: const pw.TextStyle(fontSize: 10)),
                pw.Text("Rp ${model.totalRefund.toStringAsFixed(0)}",
                    style: const pw.TextStyle(fontSize: 10)),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Center(
              child: pw.Text("Terima kasih",
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }
}
