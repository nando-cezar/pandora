import 'package:flutter/material.dart';
import '../components/my_bargraph.dart';
import '../components/my_box.dart';
import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../components/my_tile.dart';
import '../constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myFifthColor,
      body: Row(
        children: [
          MyDrawer(),
          Expanded(
            flex: 2,
            child: Column(
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
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
