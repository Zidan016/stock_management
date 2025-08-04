import 'package:drift/drift.dart';
import 'package:random_string/random_string.dart';
import 'package:stock_management/myApp/db/dbHelper.dart';

class Stokrep {
  Future getAll()async{
    final db = Dbhelper();
    try {
      List<StockData> allData = await db.select(db.stock).get();
      return allData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getbyId(id)async{
    final db = Dbhelper();
    try {
      final query = db.select(db.stock)..where((tbl) => tbl.id.equals(id),);
      final StockData = query.getSingleOrNull();
      return StockData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future editData(String id, String name)async{
    final db = Dbhelper();
    print(id+name);
    try {
      await (db.update(db.stock)..where((tbl) => tbl.id.equals(id))).write(StockCompanion(name: Value(name)));
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future deleteData(id) async{
    final db = Dbhelper();
    try {
      await (db.update(db.stockin)..where((tbl) => tbl.stockId.equals(id),)).write(const StockinCompanion(stockId: Value(null)));
      await (db.update(db.stockout)..where((tbl) => tbl.stockId.equals(id),)).write(const StockoutCompanion(stockId: Value(null)));
      await (db.delete(db.stock)..where((tbl) => tbl.id.equals(id),)).go();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future insertData(StockCompanion newData)async{
    final db = Dbhelper();
    final id = 'IN${randomAlphaNumeric(5)}';
    try {
      await db.into(db.stock).insert(newData);
      await db.into(db.stockin).insert(StockinCompanion.insert(
        id: id, 
        stock: newData.stok.value, 
        date: Value(DateTime.now()),
        stockId: newData.id
      ));
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future stockIn(List<StockData> selectedData)async{
    final db = Dbhelper();
    try {
      await db.transaction(()async{
        for(int i = 0 ;i < selectedData.length; i++){
          final id = 'IN${randomAlphaNumeric(5)}';
          final dataSelect = selectedData[i];
          final getData = await (db.select(db.stock)..where((tbl) => tbl.id.equals(dataSelect.id),)).getSingleOrNull() as StockData;
          print(getData);
          if (getData == null) {
            print("Data tidak ditemukan untuk ID: ${dataSelect.id}");
            continue; 
          }
          int stok = getData.stok + dataSelect.stok;
          final updateStock = getData.copyWith(
            stok: stok
          );
          await db.update(db.stock).replace(updateStock);

          await db.into(db.stockin).insert(StockinCompanion.insert(id : id, stockId: Value(dataSelect.id), stock: dataSelect.stok, date: Value(DateTime.now())));
        }
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future stockOut(List<StockData> selectedData)async{
    final db = Dbhelper();
    try {
      await db.transaction(()async{
        for(int i = 0 ;i < selectedData.length; i++){
          final id = 'OUT${randomAlphaNumeric(4)}';
          final dataSelect = selectedData[i];
          final getData = await (db.select(db.stock)..where((tbl) => tbl.id.equals(dataSelect.id),)).getSingleOrNull() as StockData;
          if (getData == null) {
            print("Data tidak ditemukan untuk ID: ${dataSelect.id}");
            continue; 
          }
          int stok = getData.stok - dataSelect.stok;
          final updateStock = getData.copyWith(
            stok: stok
          );
          await db.update(db.stock).replace(updateStock);

          await db.into(db.stockout).insert(StockoutCompanion.insert(id:id, stockId: Value(dataSelect.id),stock: dataSelect.stok, date: Value(DateTime.now())));
        }
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future getAllStockIn()async{
    final db = Dbhelper();
    try {
      List<StockinData> data = await db.select(db.stockin).get();
      return data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getAllStockOut()async{
    final db = Dbhelper();
    try {
      List<StockoutData> data = await db.select(db.stockout).get();
      return data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}