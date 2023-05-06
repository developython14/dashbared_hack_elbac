import 'package:flutter/material.dart';

class edit_stories extends StatefulWidget {
  const edit_stories({super.key});

  @override
  State<edit_stories> createState() => _edit_storiesState();
}

class _edit_storiesState extends State<edit_stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [Text('edit stories')],
      )),
    );
  }
}
