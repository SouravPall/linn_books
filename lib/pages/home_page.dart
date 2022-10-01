import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linn_books/utils/categories.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime today;

  @override
  void initState() {
    today = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF092d7c),
      body: Stack(
        children: [
          Container(
            //height: height * 0.36,
            //width: width,
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
                                onTap: () {},
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
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                '${DateFormat('dd-MMM hh:mm').format(today)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                    const SizedBox(height: 30,),

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
                                      Categories(
                                        categoriesList: 'images/save-money.png',
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
                                      Categories(
                                        categoriesList: 'images/expenses.png',
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
                                      Categories(
                                        categoriesList: 'images/loan.png',
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
                                      Categories(
                                        categoriesList: 'images/sand-clock.png',
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
                                      Categories(
                                        categoriesList: 'images/notes.png',
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
                                      Categories(
                                        categoriesList: 'images/wallet.png',
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
                                      Categories(
                                        categoriesList: 'images/back-in-time.png',
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
                                      Categories(
                                        categoriesList: 'images/essential.png',
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
                                    children: const [
                                      Categories(
                                        categoriesList: 'images/goal.png',
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
            )
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.8,
              builder: (BuildContext context, myScrollController){
                return ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                  child: Container(
                    height: 800,
                    color: Colors.blueGrey,
                    child: ListView.builder(
                      controller: myScrollController,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(
                            backgroundColor: Colors.pink,
                          ),
                          title: Text('Categories ${index+1}'),
                          subtitle: Text('From Cash on Hand'),
                          trailing: const Text('300'),
                        );
                      },

                    ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
