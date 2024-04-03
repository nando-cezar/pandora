import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class MyCardSettings extends StatelessWidget {
  const MyCardSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.lock_outline,
              color: myFirstColor,
            ),
            title: Text(
              "Change Password",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              //open change password
            },
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.language,
              color: myFirstColor,
            ),
            title: Text(
              "Change Language",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              //open change language
            },
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: myFirstColor,
            ),
            title: Text(
              "Change Location",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              //open change location
            },
          ),
        ],
      ),
    );
  }
}
