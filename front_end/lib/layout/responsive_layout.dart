import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(GetPlatform.isMobile){
          return mobileScaffold;
        }else if(constraints.maxWidth < 1100){
          return tabletScaffold;
        }else{
          return desktopScaffold;
        }
      },
    );
  }
}
