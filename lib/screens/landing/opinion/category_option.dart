import 'package:flutter/material.dart';

class opinion_category extends StatelessWidget {
  const opinion_category({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.verified,
              color: Colors.green,
            ),
            title: Text('accepted optimion'),
            onTap: () {
              Navigator.pushNamed(context, '/accepted_opinion');
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.verified,
              color: Colors.red,
            ),
            title: Text('pending optimion'),
            onTap: () {
              Navigator.pushNamed(context, '/requested_opinion');
            },
          ),
        ),
      ],
    );
  }
}
