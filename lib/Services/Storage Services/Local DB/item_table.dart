import 'package:foodpanda_clone/Services/Storage%20Services/Local%20DB/local_db.dart';
import 'package:sqflite/sqflite.dart';

class ItemTable {
  String itemsTable = 'itemsTable';
  String primeKey = 'primeKey';
  String itemKey = 'itemKey';
  String itemImageUrl = 'itemImageUrl';
  String itemName = 'itemName';
  String itemDescription = 'itemDescription';
  String itemQuantity = 'itemQuantity';
  String itemBasePrice = 'itemBasePrice';
  String itemTotalPrice = 'itemTotalPrice';

  Future getItemsListFromTable() async {
    Database db = await DatabaseHelper().database;

    var result = await db.query(itemsTable, orderBy: '$primeKey ASC');
    return result;
  }

  Future insertItemIntoTable({
    String? keyOfItem,
    String? nameOfItem,
    String? descriptionOfItem,
    String? quantityOfItem,
    String? basePriceOfItem,
    String? totalPriceOfItem,
  }) async {
    Database db = await DatabaseHelper().database;
    var row = {
      itemKey: keyOfItem,
      itemName: nameOfItem,
      itemDescription: descriptionOfItem,
      itemQuantity: quantityOfItem,
      itemBasePrice: basePriceOfItem,
      itemTotalPrice: totalPriceOfItem
    };
    var result = await db.insert(itemsTable, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future updateItemQuantity(
      {int? itemPrimeKey,
      String? idOfItem,
      String? quantityOfItem,
      String? totalPriceOfItem}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      itemKey: idOfItem,
      itemQuantity: quantityOfItem,
      itemTotalPrice: totalPriceOfItem,
    };
    var result = await db.update(itemsTable, row,
        where: 'primeKey =$itemPrimeKey and itemId = $idOfItem');
    return result;
  }

  Future deleteItem({int? itemPrimeKey, String? idOfItem}) async {
    Database db = await DatabaseHelper().database;

    var result = await db.delete(itemsTable,
        where: 'primeKey =$itemPrimeKey and itemId = $idOfItem');
    return result;
  }

  Future clearItemTable() async {
    Database db = await DatabaseHelper().database;
    return await db.rawDelete("DELETE FROM $itemsTable");
  }
}
