import 'package:flutter/cupertino.dart';
import 'package:linn_books/models/Income_model.dart';
import '../db/dbhelper.dart';

class IncomeProvider extends ChangeNotifier {
  List<IncomeModel> incomeList = [];

  Future<bool> insertIncome(IncomeModel incomeModel) async{
    final rowId = await DBHelper.insertIncome(incomeModel);
    if (rowId > 0) {
      incomeModel.id = rowId;
      incomeList.add(incomeModel);
      return true;
    }
    return false;
  }

  getAllNIncome() async{
    DBHelper.getAllNIncome().then((value) {
      incomeList = value;
      notifyListeners();
    });
  }
}