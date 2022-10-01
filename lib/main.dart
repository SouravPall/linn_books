import 'package:flutter/material.dart';
import 'package:linn_books/pages/Income_page.dart';
import 'package:linn_books/pages/home_page.dart';
import 'package:linn_books/utils/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        IncomePage.routeName: (_) => IncomePage(),
      },
    );
  }
}
