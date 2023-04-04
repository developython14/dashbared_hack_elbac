import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/modules/componant/module.dart';

class modules extends StatelessWidget {
  const modules({Key? key}) : super(key: key);

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
                module_componant(
                  hei: hei,
                  title: 'العلوم الفيزيائية',
                  abre:
                      'https://2as.ency-education.com/uploads/1/0/9/0/1090282/icon-new-english_orig.png',
                  path: '/profs',
                ),
                module_componant(
                  hei: hei,
                  title: ' العلوم الطبيعية ',
                  abre:
                      'https://2as.ency-education.com/uploads/1/0/9/0/1090282/icon-new-sciences_orig.png',
                  path: '/profs',
                ),
              ],
            ),
          ),
        )),
      )),
    );
  }
}
