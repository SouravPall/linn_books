// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linn_books/providers/income_provider.dart';
import 'package:linn_books/utils/categories.dart';
import 'package:provider/provider.dart';

import '../widgets/my_header_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime today;
  bool isInit = true;

  @override
  void initState() {
    today = DateTime.now();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit)
      Provider.of<IncomeProvider>(context, listen: false).getAllNIncome();
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(
        Provider.of<IncomeProvider>(context, listen: false).incomeList.length);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/income-page');
        },
        backgroundColor: const Color(0xFF092d7c),
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFF092d7c),
      body: Stack(
        children: [
          Container(
              color: Colors.transparent,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //-------Menu----------
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    const MyHeaderDrawer();
                                  },
                                  child: Image.asset(
                                    'images/menu.png',
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                    color: Colors.white,
                                  )),
                              const SizedBox(width: 10),
                              const Text(
                                'Linn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Books',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          //----------Icon-------
                          TextButton(
                            onPressed: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'images/key-person.png',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 3.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Sourav',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                          size: 24,
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${DateFormat('dd-MMM hh:mm a').format(today)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Balance',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'images/taka.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.cover,
                                        color: Colors.white,
                                      ),
                                      const Text(
                                        '0.0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Text('+0.00'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Text('+0.00'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Text('+0.00'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Text('+0.00'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      //----------categories------
                      Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(4.0),
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/income-page');
                                          },
                                          child: Categories(
                                            categoriesList:
                                                'images/save-money.png',
                                          ),
                                        ),
                                        Text(
                                          'Income',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList:
                                                'images/expenses.png',
                                          ),
                                        ),
                                        Text(
                                          'Expense',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList: 'images/loan.png',
                                          ),
                                        ),
                                        Text(
                                          'Loan',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList:
                                                'images/sand-clock.png',
                                          ),
                                        ),
                                        Text(
                                          'Sync',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList: 'images/notes.png',
                                          ),
                                        ),
                                        Text(
                                          'NList',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList: 'images/wallet.png',
                                          ),
                                        ),
                                        Text(
                                          'Wallet',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList:
                                                'images/back-in-time.png',
                                          ),
                                        ),
                                        Text(
                                          'Fix Pay',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList:
                                                'images/essential.png',
                                          ),
                                        ),
                                        Text(
                                          'Budget',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Categories(
                                            categoriesList: 'images/goal.png',
                                          ),
                                        ),
                                        Text(
                                          'Goal',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.8,
              builder: (BuildContext context, myScrollController) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                  child: Container(
                    height: 800,
                    color: Colors.blueGrey,
                    child: DefaultTabController(
                      length: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 4),
                        child: Column(
                          children: [
                            TabBar(tabs: [
                              Tab(
                                text: 'Records',
                              ),
                              Tab(
                                text: 'Loan',
                              ),
                            ]),
                            Expanded(
                              child: TabBarView(children: [
                                Consumer<IncomeProvider>(
                                  builder: (context, provider, child) =>
                                      provider.incomeList != null
                                          ? ListView.builder(
                                              controller: myScrollController,
                                              itemCount: provider.incomeList.length,
                                              itemBuilder: (context, index) {
                                                final incomeM = provider.incomeList[index];
                                                return SizedBox(
                                                  height: 90,
                                                  width: double.infinity,
                                                  child: Card(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 45,
                                                          width: 45,
                                                          color: Colors.black54,
                                                          child: Text(incomeM.category.substring(0, 2)),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 15),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                              children: [
                                                                Text(incomeM.category),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(incomeM.note != null ? incomeM.note! : 'No note here'),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text('Income'),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                  '??? ${incomeM.amount}'),
                                                              SizedBox(
                                                                  height: 5),
                                                              Text(
                                                                DateFormat('dd-MMM-yyyy, hh mm a').format(DateTime.parse(incomeM.createDate)),
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.grey,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                                );
                                              },
                                            )
                                          : Center(
                                              child: Text('No data added yet')),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset('images/team.png'),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "No Loan Users Found",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
