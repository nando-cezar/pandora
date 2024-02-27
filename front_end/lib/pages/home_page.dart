import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pandora_front/layout/desktop_scaffold.dart';
import 'package:pandora_front/layout/mobile_scaffold.dart';
import 'package:pandora_front/layout/responsive_layout.dart';
import 'package:pandora_front/layout/tablet_scaffold.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TableScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ),
    );
  }
}
