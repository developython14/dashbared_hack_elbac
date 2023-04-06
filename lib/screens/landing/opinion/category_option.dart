import 'package:flutter/material.dart';

class opinion_category extends StatelessWidget {
  const opinion_category({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/accepted_opinion');
            },
            child: Text('accepted optimion')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/requested_opinion');
            },
            child: Text('pending faq'))
      ],
    );
  }
}
