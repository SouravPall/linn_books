// ignore_for_file: file_names

const String tableIncome = 'tbl_income';
const String tableIncomeColId = 'id';
const String tableIncomeColNote = 'note';
const String tableIncomeColCreateDate = 'createDate';
const String tableIncomeColCategory = 'category';
const String tableIncomeColAmount = 'amount';

class IncomeModel {
  int? id;
  String? note;
  String createDate;
  String category;
  int amount;

  IncomeModel({
    this.id,
    this.note,
    required this.createDate,
    required this.category,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      tableIncomeColNote: note,
      tableIncomeColCreateDate: createDate,
      tableIncomeColCategory: category,
      tableIncomeColAmount: amount,
    };
    if (id != null) {
      map[tableIncomeColId] = id;
    }
    return map;
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) => IncomeModel(
        id: map[tableIncomeColId],
        note: map[tableIncomeColNote],
        createDate: map[tableIncomeColCreateDate],
        category: map[tableIncomeColCategory],
        amount: map[tableIncomeColAmount],
  );
}
