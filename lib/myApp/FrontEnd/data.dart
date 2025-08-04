import 'package:flutter/material.dart';
import 'package:stock_management/myApp/BackEnd/repository/stokRep.dart';
import 'package:stock_management/myApp/db/dbHelper.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<StockData> listData = [];
  List<StockData> cari = [];
  Stokrep repStok = Stokrep();
  TextEditingController newName = TextEditingController();
  TextEditingController pencarian = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllData();
    pencarian.addListener(filter);
  }

  getAllData()async{
    List<StockData> get = await repStok.getAll();
    setState(() {
      listData = get;
      cari = get;
    });
  }

  deleteData(id)async{
    final respone = await repStok.deleteData(id);
    if(respone == true){
      await getAllData();
      const snackbar = SnackBar(content: Text('Succes Delete Data'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }else{
      const snackbar = SnackBar(content: Text('Fail Delete Data'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  popupDelete(BuildContext context, id){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Are you sure delete this data ?'),
          actions: [
            TextButton(
              onPressed: ()async{
                await deleteData(id);
                Navigator.pop(context);
              }, child: Text('Yes')),
            TextButton(
              onPressed: ()async{
                Navigator.pop(context);
              }, child: Text('Cancel'))
          ],
        );
      }
    );
  }
  
  popUpEdit(BuildContext context,String name, String id){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Edit Data'),
          content: TextField(controller: newName, decoration: InputDecoration(labelText: 'New Name'),),
          actions: [
            TextButton(
              onPressed: ()async{
                await editData(newName.text, id);
                Navigator.pop(context);
              }, child: Text('Yes')),
            TextButton(
              onPressed: ()async{
                Navigator.pop(context);
              }, child: Text('Cancel'))
          ],
        );
      }
    );
  }
  
  editData(String name, String id)async{
    final respone = await repStok.editData(id, name);
    if(respone == true){
      await getAllData();
      newName.text ='';
      const snackbar = SnackBar(content: Text('Succes Edit Data'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }else{
      const snackbar = SnackBar(content: Text('Fail Edit Data'), duration: Durations.long1,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  filter(){
    setState(() {
      if(pencarian.text.isEmpty){
        listData = cari;
      }else{
        listData = cari
            .where((data) => data.name.toLowerCase().contains(pencarian.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: pencarian,
              decoration: InputDecoration(
                hintText: 'Search Data',
                suffixIcon: Icon(Icons.search)
              ),
            ),
            const SizedBox(height: 15,),
            listData.isEmpty ? Center(child: Text('Not yet Data, Add new stock in for new data'),) :
            Expanded(
              child: ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index){
                  final data = listData[index];
                  return InkWell(
                    onTap: (){
                      newName.text= data.name;
                      popUpEdit(context, data.name, data.id);
                    },
                    onLongPress: (){
                      popupDelete(context, data.id);
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
      ),
    );
  }
}