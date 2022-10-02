import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Income_model.dart';

class DBHelper {
  static  String createTableIncome = '''
  create table $tableIncome(
  $tableIncomeColId integer primary key,
  $tableIncomeColNote text,
  $tableIncomeColCreateDate text,
  $tableIncomeColCategory text,
  $tableIncomeColAmount integer
  )
  ''';

  static Future<Database> open() async{
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, 'income.db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(createTableIncome);
    });
  }

  static Future<int> insertIncome(IncomeModel incomeModel) async{
    final db = await open();
    return db.insert(tableIncome, incomeModel.toMap());
  }

  static Future<List<IncomeModel>> getAllNIncome() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableIncome);
    return List.generate(mapList.length, (index) => IncomeModel.fromMap(mapList[index]));
  }
}