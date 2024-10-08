import 'dart:async';

import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_user.dart';
import 'package:sqflite/sqflite.dart';

class AppDb {
  static final AppDb instance = AppDb._internal();
  static Database? _database;

  final String _TABLE_BENEFICIARIES = "Beneficiary";
  final String _TABLE_USER = "User";

  var user = User(
    id: 1,
    availableAmount: 100,
    spentAmount: 0,
    maxMonthlyAmount: 3000,
    maxPerBeneficiaryAmount: 10,
  );

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

  _createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE '
      '$_TABLE_USER'
      '( id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'availableAmount INTEGER NOT NULL,'
      'spentAmount INTEGER NOT NULL,'
      'maxMonthlyAmount INTEGER NOT NULL,'
      'maxPerBeneficiaryAmount INTEGER NOT NULL'
      ')',
    );

    await db.insert(
      _TABLE_USER,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.execute(
      'CREATE TABLE '
      '$_TABLE_BENEFICIARIES'
      '( id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT NOT NULL, '
      'phone TEXT NOT NULL, '
      'pastToppedUpAmount INTEGER NOT NULL '
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
      _TABLE_BENEFICIARIES,
      beneficiary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return beneficiary;
  }

  Future<List<ModelBeneficiary>> readAll() async {
    final db = await instance.database;
    final result = await db.query(_TABLE_BENEFICIARIES, orderBy: 'name ASC');
    var list = [
      for (final {
            'id': id as int,
            'name': name as String,
            'phone': phone as String,
            'pastToppedUpAmount': pastToppedUpAmount as int,
          } in result)
        ModelBeneficiary(
          id: id,
          name: name,
          phone: phone,
          pastToppedUpAmount: pastToppedUpAmount,
        ),
    ];

    return list;
  }

  Future<User> readUser() async {
    final db = await instance.database;
    final result = await db.query(_TABLE_USER);
    var mapList = result;
    var json = mapList.first;
    var user = User.fromJson(json);
    return user;
  }

  Future<int> updateUser(User user) async {
    this.user = user;
    final db = await instance.database;
    final result = await db.update(
      _TABLE_USER,
      user.toMap(),
      where: '${user.id} = ?',
      whereArgs: [user.id],
    );
    return result;
  }

  Future<int> updateBeneficiaryTopUpAmount(
    ModelBeneficiary ben,
    int amount,
  ) async {
    ben.pastToppedUpAmount = ben.pastToppedUpAmount + amount;
    final db = await instance.database;
    final result = await db.update(
      _TABLE_BENEFICIARIES,
      ben.toMap(),
      where: 'id = ?',
      whereArgs: [ben.id],
    );
    return result;
  }

  // Future<int> readAvailableAmount() async {
  //   final db = await instance.database;
  //   final result = await db.query(_TABLE_USER);
  //   var mapList = result;
  //   var json = mapList.first;
  //   var user = User.fromJson(json);
  //   return user.availableAmount;
  // }

  Future<int> updateAvailableAmount(int newAmount) async {
    user.spentAmount = user.spentAmount + (user.availableAmount - newAmount);
    user.availableAmount = newAmount;
    final db = await instance.database;
    final result = await db.update(
      _TABLE_USER,
      user.toMap(),
      where: '${user.id} = ?',
      whereArgs: [user.id],
    );
    return result;
  }

// Future<int> readSpentAmount() async {
//   final db = await instance.database;
//   final result = await db.query(_TABLE_USER);
//   var mapList = result;
//   var json = mapList.first;
//   var user = User.fromJson(json);
//   return user.spentAmount;
// }
}
