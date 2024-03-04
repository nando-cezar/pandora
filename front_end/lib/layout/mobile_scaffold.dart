import 'package:flutter/material.dart';
import 'package:pandora_front/components/my_tile.dart';
import '../components/my_bargraph.dart';
import '../components/my_drawer.dart';
import '../components/my_navbar.dart';
import '../constants.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myFifthColor,
      drawer: MyDrawer(),
      body: Column(
        children: [
          const Expanded(
            child: MyBarGraph(),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
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
