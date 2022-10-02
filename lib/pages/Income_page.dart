// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linn_books/providers/income_provider.dart';
import 'package:provider/provider.dart';
import '../models/Income_model.dart';
import '../widgets/custom_text_form_fiel.dart';

class IncomePage extends StatefulWidget {
  static const routeName = '/income-page';
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final items = ['Allowance', 'Tips', 'Other', 'Salary', 'Pretty cash'];
  String? defaultValue;
  final TextEditingController _amountController = TextEditingController();

  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black38)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(_dateTime == null
                      ? DateFormat('dd/MM/yyyy').format(DateTime.now())
                      : DateFormat('dd/MM/yyyy').format(_dateTime!)),
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
                  hint: Text(
                    'Select Category',
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  isExpanded: true,
                  value: defaultValue,
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      defaultValue = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                if (_amountController.text != null &&
                    defaultValue != null &&
                    _dateTime != null) {
                  final incomeModel = IncomeModel(
                    createDate: _dateTime.toString(),
                    category: defaultValue.toString(),
                    amount: int.parse(_amountController.text),
                  );
                  final status =
                      await Provider.of<IncomeProvider>(context, listen: false)
                          .insertIncome(incomeModel);
                      print(_dateTime);
                      print(defaultValue);
                      print(_amountController.text);
                  if (status) {
                    Navigator.pushNamed(context, '/home-page');
                  }
                } else {
                  print('wrong');
                }
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
    });
  }
}
