import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/device_controller.dart';
import '../state/device_state.dart';

class MyCardProfile extends StatelessWidget {
  MyCardProfile({super.key});

  final DeviceController _controllerDevice = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Theme.of(context).colorScheme.primary,
      child: _controllerDevice.state.value == DeviceState.mobile
          ? Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Luís Fernando Cezar dos Santos",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png'),
                  ),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'ID:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'XXX.XXX.XXX.XXX.XXX',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'E-mail:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'nandocezar22@gmail.com',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'Current location:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Salvador - BA, Brazil',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'Number of alerts issued:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '100',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Column(
                    children: [
                      Text(
                        'Date of last alert issuance:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '25/05/1997 - 3:00 PM',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "John Doe",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png'),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'E-mail:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'nandocezar22@gmail.com',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 20),
                      Text(
                        'ID:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'XXX.XXX.XXX.XXX.XXX',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Current location:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Salvador - BA, Brazil',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Number of alerts issued:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '100',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 20),
                      Text(
                        'Date of last alert issuance:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '25/05/1997 - 3:00 PM',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
