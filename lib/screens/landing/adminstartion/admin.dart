import 'package:flutter/material.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.people_outline,
              ),
              title: Text('Students'),
              onTap: () {
                Navigator.pushNamed(context, '/accepted_opinion');
              },
            ),
          ),
        ],
      )),
    );
  }
}
