import 'package:flutter/material.dart';
import 'package:pandora_front/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../components/my_card_profile.dart';
import '../components/my_card_settings.dart';
import '../constants.dart';

class SettingsPage extends StatefulWidget {
  static const String path = "lib/src/pages/settings/settings1.dart";

  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyCardProfile(),
                const SizedBox(height: 10.0),
                const MyCardSettings(),
                const SizedBox(height: 20.0),
                Text(
                  "General Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: myFirstColor,
                  ),
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: const Text("Dark mode"),
                  onChanged: (val) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: myFirstColor,
                  ),
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: const Text("Received notification"),
                  onChanged: (val) {},
                ),
                SwitchListTile(
                  activeColor: myFirstColor,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: const Text("Received newsletter"),
                  onChanged: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
