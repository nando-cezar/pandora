import 'package:flutter/material.dart';
import 'package:pandora_front/layout/desktop_scaffold.dart';
import 'package:pandora_front/layout/mobile_scaffold.dart';
import 'package:pandora_front/layout/responsive_layout.dart';
import 'package:pandora_front/layout/tablet_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TableScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
