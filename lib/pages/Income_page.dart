import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  static const routeName = '/income-page';
  const IncomePage({Key? key}) : super(key: key);

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF092d7c),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Add Income')),
        actions: const [
          Icon(Icons.info_outline)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
