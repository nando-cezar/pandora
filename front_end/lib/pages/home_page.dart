import 'package:flutter/material.dart';
import 'package:pandora_front/layout/desktop_scaffold.dart';
import 'package:pandora_front/layout/mobile_scaffold.dart';
import 'package:pandora_front/layout/responsive_layout.dart';
import 'package:pandora_front/layout/tablet_scaffold.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TableScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
