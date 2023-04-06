import 'package:flutter/material.dart';

class opinion_category extends StatelessWidget {
  const opinion_category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}
