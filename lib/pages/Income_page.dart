import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_text_form_fiel.dart';

class IncomePage extends StatefulWidget {
  static const routeName = '/income-page';
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {

  List dropDownListData = [
    {'title': 'Allowance', 'value': '1'},
    {'title': 'Tips', 'value': '2'},
    {'title': 'Other Income', 'value': '3'},
    {'title': 'Salary', 'value': '4'},
    {'title': 'Pretty cash', 'value': '5'},
  ];
  String defaultValue = '';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Add Income')),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.info_outline),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: _amountController,
              textLable: 'Amount',
            ),
            const SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                pickDateTime();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(_dateTime == null ? DateFormat('dd/MM/yyyy').format(DateTime.now()) : DateFormat('dd/MM/yyyy').format(_dateTime!)),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                contentPadding: const EdgeInsets.all(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: defaultValue,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        value: "",
                        child: Text(
                          "Select",
                        )),
                    ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                      return DropdownMenuItem(
                          value: data['value'],
                          child: Text(data['title']));
                    }).toList(),
                  ],
                  onChanged: (newValue) {
                    setState(
                          () {
                        defaultValue = newValue!;
                        print(defaultValue);
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                if (defaultValue == "") {
                  print("Please Select a Category");
                } else {
                  print("Selected Category Value $defaultValue");
                }
                Navigator.pushNamed(context, '/home-page');
              },
              child: const Text("Submit"),
            ),

          ],
        ),
      ),
    );
  }
  Future<void> pickDateTime() async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateTime ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(
                primary: Colors.greenAccent,
                onPrimary: Colors.white,
                onSurface: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ?? const Text(''),
        ));
    if (newDate == null) {
      return;
    }
    setState(() {
      _dateTime = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateTimeController.text = dob;
    });
  }


}