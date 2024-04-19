import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pandora_front/model/user_credential_model.dart';

class MyCardProfile extends StatefulWidget {
  const MyCardProfile({super.key});

  @override
  State<MyCardProfile> createState() => _MyCardProfileState();
}

class _MyCardProfileState extends State<MyCardProfile> {
  final _userCredential = UserCredentialModel();

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() => _userCredential.updateUserCredential(user));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Theme.of(context).colorScheme.primary,
      child: GetPlatform.isMobile
          ? _buildMobileProfile(context)
          : _buildDesktopProfile(context),
    );
  }

  Column _buildDesktopProfile(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            _userCredential.displayName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_userCredential.photoURL),
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
                _userCredential.email,
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
                _userCredential.uid,
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
                'Account creation date:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(_userCredential.creationTime),
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 20),
              Text(
                'Last login date:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(_userCredential.lastSignInTime),
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
    );
  }

  Column _buildMobileProfile(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            _userCredential.displayName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_userCredential.photoURL),
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
                _userCredential.uid,
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
                _userCredential.email,
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
                'Account creation date:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(_userCredential.creationTime),
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
                'Last login date:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                DateFormat('dd/MM/yyyy HH:mm:ss')
                    .format(_userCredential.lastSignInTime),
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
    );
  }
}
