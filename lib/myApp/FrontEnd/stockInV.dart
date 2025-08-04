import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:stock_management/myApp/BackEnd/repository/stokRep.dart';
import 'package:stock_management/myApp/db/dbHelper.dart';

class Stockinv extends StatefulWidget {
  const Stockinv({super.key});

  @override
  State<Stockinv> createState() => _StockinvState();
}

class _StockinvState extends State<Stockinv> {
  List<StockData> listStock = [];
  List<StockData> selected = [];
  List<StockData> cari = [];
  TextEditingController pencarian = TextEditingController();
  TextEditingController newName = TextEditingController();
  TextEditingController newStock = TextEditingController();
  Stokrep repStok = Stokrep();
  int ceklist = 0;

  @override
  void initState() {
    super.initState();
    getAllData();
    pencarian.addListener(filter);
  }

  getAllData()async{
    List<StockData> data = await repStok.getAll();
    if(data.isNotEmpty){
      setState(() {
        listStock = data;
        cari = data;
      });
    }else{
      const snackbar = SnackBar(content: Text('Not yet Data'), duration: Durations.short3,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  insertIn()async{
    final id = 'D${randomAlphaNumeric(7)}';
    final newdata = StockCompanion.insert(id:id, name:  newName.text, stok: int.parse(newStock.text));
    final respone = await repStok.insertData(newdata);
    if(respone == true){
      const snackbar = SnackBar(content: Text('Succes New Stock in'), duration: Durations.medium1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      getAllData();
      newName.text = '';
      newStock.text = '';
    }else{
      const snackbar = SnackBar(content: Text('Fail New Stock in'), duration: Durations.medium1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  selectedData(id, name) async {
    StockData insertData = StockData(id: id, stok: int.parse(newStock.text), name: name);

    setState(() {
      int index = selected.indexWhere((item) => item.id == id);

      if (index != -1) {
        selected[index] = insertData;
      } else {
        selected.add(insertData);
        ceklist++;
      }

    });
  }

  popupSetStock(BuildContext context, int stok, String id, String name) {
    showDialog(
      context: context,
      builder: (context) {
        String alert = ''; 

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Set Stock'),
              content: Container(
                height: 90.0,
                width: double.maxFinite,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      TextField(
                        controller: newStock,
                        decoration: InputDecoration(
                          labelText: 'Stock',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Text(
                        alert,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (newStock.text.isEmpty) {
                      setState(() {
                        alert = 'Please enter a stock value!';
                      });
                      return;
                    }else {
                      selectedData(id, name);
                      Navigator.pop(context); 
                      newStock.text = '';
                    }                    
    
                  },
                  child: Text('Set'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
  
  popupAdd(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('New Data'),
          content: Container(
            height: 110.0,
            width: double.maxFinite,
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: newName,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: newStock,
                    decoration: InputDecoration(
                      labelText: 'Stock',
                    ),
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: ()async{
              await insertIn();
              Navigator.pop(context);
            }, child: Text('Add')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel'))
          ],
        );
      }
    );
  }

  popUpListSelect(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Chcek Data'),
              content: Container(
                height: 300.0,
                width: double.maxFinite,
                child: Center(
                  child: ListView.builder(
                    itemCount: selected.length,
                    itemBuilder: (context, index) {
                      final data = selected[index];
                      return Row(
                        children: [
                          Text(data.name),
                          Spacer(),
                          Text(data.stok.toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selected.removeWhere((item) => item.id == data.id);
                                ceklist--;
                              });
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                        ],
                      );
                    }
                  )
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await stockIn();
                    Navigator.pop(context);
                  },
                  child: Text('Check out'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          }
        );
      }
    );
  }

  stockIn()async{
    final respone = await repStok.stockIn(selected);
    if(respone == true){
      await getAllData();
      ceklist = 0;
      selected = [];
      const snackbar = SnackBar(content: Text('Succes New Stock in'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }else{
      const snackbar = SnackBar(content: Text('Fail New Stock in'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  filter(){
    setState(() {
      if(pencarian.text.isEmpty){
        listStock = cari;
      }else{
        listStock = cari
            .where((data) => data.name.toLowerCase().contains(pencarian.text.toLowerCase()))
            .toList();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        popupAdd(context);
      },child: Icon(Icons.add_circle_outline),),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child:  
                TextField(
                  controller: pencarian,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search data'
                  ),
                ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  popUpListSelect(context);
                }, 
                child: Text(ceklist.toString()),
              )
              ],
            ),
            
            const SizedBox(height: 10,),

            listStock.isEmpty ?
            Center(child: Text('Click add button to create new data and stock in'),) :

            Expanded(
              child: ListView.builder(
                itemCount: listStock.length,
                itemBuilder: (context, index){
                  final data = listStock[index];
                  return InkWell(
                    onTap: (){
                      popupSetStock(context, data.stok, data.id, data.name);
                    },
                    child: Card(
                      child: Padding(padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(data.name),
                            const Spacer(),
                            Text('Stock : '),
                            Text(data.stok.toString())
                          ],
                        ),
                      ),
                    ),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}