import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobile_recharge_app/db/db_models/model_beneficiary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static final AppDb instance = AppDb._internal();
  static Database? _database;

  AppDb._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/rechargeApp.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute(
      'CREATE TABLE '
      'Beneficiary('
      'name TEXT NOT NULL, '
      'phone INTEGER PRIMARY KEY '
      ')',
    );
  }

  Future<ModelBeneficiary> create(ModelBeneficiary beneficiary) async {
    final db = await instance.database;
    await db.insert(
      'Beneficiary',
      beneficiary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return beneficiary;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<ModelBeneficiary>> readAll() async {
    final db = await instance.database;
    final result = await db.query('Beneficiary');
    return [
      for (final {
      'name': name as String,
      'phone': phone as int,
      } in result)
        ModelBeneficiary(name: name, phone: phone),
    ];
  }

}

// Future<Database> openConnectionToDb() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final db = openDatabase(
//     join(await getDatabasesPath(), 'database.db'),
//   ).whenComplete(() => {});
//   return db;
// }
//
// void initDb() async {
//   openDatabase(
//     join(await getDatabasesPath(), 'database.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE Beneficiary(id INTEGER PRIMARY KEY, name TEXT, phone INTEGER)',
//       );
//     },
//     version: 1,
//   );
// }

// Future<void> createBeneficiary(ModelBeneficiary beneficiary) async {
//   final db = await openConnectionToDb();
//   await db.insert(
//     'Beneficiary',
//     beneficiary.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
