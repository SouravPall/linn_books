import 'package:flutter/material.dart';

class RecordsList extends StatefulWidget {
  const RecordsList({Key? key}) : super(key: key);

  @override
  State<RecordsList> createState() => _RecordsListState();
}

class _RecordsListState extends State<RecordsList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(onPressed: (){
        bottomSheets(context);
      }),
    );
  }

  void bottomSheets(BuildContext context) {
    showModalBottomSheet(context: context, 
        backgroundColor: Colors.transparent,

        builder: (context) => Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    ));
  }
}
