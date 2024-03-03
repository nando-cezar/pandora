import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/my_bargraph.dart';
import '../components/my_box.dart';
import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../components/my_tile.dart';
import '../constants.dart';

class TableScaffold extends StatefulWidget {
  const TableScaffold({super.key});

  @override
  State<TableScaffold> createState() => _TableScaffoldState();
}

class _TableScaffoldState extends State<TableScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myFifthColor,
      drawer: MyDrawer(),
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 0,
                ),
                child: MyBarGraph(),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const MyTile();
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
