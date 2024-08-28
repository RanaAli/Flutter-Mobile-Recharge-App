import 'dart:async';

import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
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

  Future close() async {
    final db = await instance.database;
    db.close();
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

  Future<List<ModelBeneficiary>> readAll() async {
    final db = await instance.database;
    final result = await db.query('Beneficiary', orderBy: 'name ASC');
    return [
      for (final {'name': name as String, 'phone': phone as int} in result)
        ModelBeneficiary(name: name, phone: phone),
    ];
  }
}
