import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandora_front/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsOnePage extends StatefulWidget {
  static const String path = "lib/src/pages/settings/settings1.dart";

  const SettingsOnePage({super.key});

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
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
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.purple,
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    title: const Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png'),
                    ),
                    trailing: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(
                          Icons.lock_outline,
                          color: Colors.purple,
                        ),
                        title: const Text("Change Password"),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                      const Divider(height: 20),
                      ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.language,
                          color: Colors.purple,
                        ),
                        title: const Text("Change Language"),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                      const Divider(height: 20),
                      ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: Colors.purple,
                        ),
                        title: const Text("Change Location"),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change location
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "General Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: const Text("Dark mode"),
                  onChanged: (val) {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: const Text("Received notification"),
                  onChanged: (val) {},
                ),
                const SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: EdgeInsets.all(0),
                  value: false,
                  title: Text("Received newsletter"),
                  onChanged: null,
                ),
                SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: const Text("Received Offer Notification"),
                  onChanged: (val) {},
                ),
                const SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: EdgeInsets.all(0),
                  value: true,
                  title: Text("Received App Updates"),
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
