import 'package:flutter/material.dart';

class MyDrawerList extends StatelessWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15,),
      child: Column(
        //shows the List of Menu drawer
        children: [
          menuItem(),
        ],
      ),
    );
  }
  Widget menuItem(){
    return Material(
      child: InkWell(
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children:  const [
              Expanded(
                child: Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}