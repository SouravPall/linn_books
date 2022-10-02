class IncomeModel{
  int amount;
  String categories;
  String dateTime;
  String? note;


  IncomeModel({required this.amount, required this.categories, required this.dateTime, this.note});

  @override
  String toString() {
    return 'IncomeModel{amount: $amount, categories: $categories, dateTime: $dateTime, note: $note}';
  }
}