import 'package:flutter/material.dart';

class opinion_category extends StatelessWidget {
  const opinion_category({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.4,
          vertical: width * 0.4,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.4,
                vertical: width * 0.4,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/accepted_opinion');
                  },
                  child: Text('accepted optimion')),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/requested_opinion');
                },
                child: Text('pending faq'))
          ],
        ),
      ),
    );
  }
}
