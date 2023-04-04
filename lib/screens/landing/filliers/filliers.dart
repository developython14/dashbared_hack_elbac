import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';

class filliers extends StatelessWidget {
  const filliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                levels_componant(
                  hei: hei,
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                ),
                levels_componant(
                  hei: hei,
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                ),
                levels_componant(
                  hei: hei,
                  title: 'علوم تجريبية',
                  color: Colors.green,
                  abre: '3ass',
                  path: '/modules',
                )
              ],
            ),
          ),
        )),
      )),
    );
  }
}
