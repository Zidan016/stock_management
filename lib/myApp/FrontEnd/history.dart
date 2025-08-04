import 'package:flutter/material.dart';
import 'package:stock_management/myApp/BackEnd/repository/stokRep.dart';
import 'package:stock_management/myApp/db/dbHelper.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String status = 'Stock In';
  List<StockinData> listIn = [];
  List<StockoutData> listOut = [];
  List<StockinData> filteredListIn = [];
  List<StockoutData> filteredListOut = [];
  Stokrep repStok = Stokrep();

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    getAllIn();
  }

  Future<void> getAllIn() async {
    List<StockinData> data = await repStok.getAllStockIn();
    setState(() {
      listIn = data;
      filteredListIn = data;
      status = 'Stock In';
    });
  }

  Future<void> getAllOut() async {
    List<StockoutData> data = await repStok.getAllStockOut();
    setState(() {
      listOut = data;
      filteredListOut = data;
      status = 'Stock Out';
    });
  }

  void filterData() {
    if (startDate == null || endDate == null) {
      setState(() {
        filteredListIn = listIn;
        filteredListOut = listOut;
      });
      return;
    }

    if (status == 'Stock In') {
      setState(() {
        filteredListIn = listIn.where((item) {
          if (item.date == null) return false;
          return item.date!.isAfter(startDate!.subtract(const Duration(days: 1))) &&
              item.date!.isBefore(endDate!.add(const Duration(days: 1)));
        }).toList();
      });
    } else {
      setState(() {
        filteredListOut = listOut.where((item) {
          if (item.date == null) return false;
          return item.date!.isAfter(startDate!.subtract(const Duration(days: 1))) &&
              item.date!.isBefore(endDate!.add(const Duration(days: 1)));
        }).toList();
      });
    }
  }

  Future<void> selectDateRange(BuildContext context, bool isStart) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
        filterData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isStockIn = status == 'Stock In';
    var data;
    if(status == 'Stock In'){
      data =filteredListIn;
    }else{
      data = filteredListOut;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  status,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    if (isStockIn) {
                      await getAllOut();
                    } else {
                      await getAllIn();
                    }
                  },
                  child: const Text('Switch'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => selectDateRange(context, true),
                  child: Text(
                      "Start: ${startDate?.toLocal().toString().split(' ')[0] ?? 'Not Selected'}"),
                ),
                ElevatedButton(
                  onPressed: () => selectDateRange(context, false),
                  child: Text(
                      "End: ${endDate?.toLocal().toString().split(' ')[0] ?? 'Not Selected'}"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  String name= '';
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          item.stock.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: isStockIn ? Colors.green : Colors.red,
                      ),
                      title: Text(name),
                      subtitle: Text(item.date?.toIso8601String() ?? "No Date"),
                      trailing: Text(item.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
