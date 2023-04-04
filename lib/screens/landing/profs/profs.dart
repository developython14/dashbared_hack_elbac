import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/modules/componant/module.dart';

class profs extends StatelessWidget {
  const profs({Key? key}) : super(key: key);

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
                  title: 'الاستاذ مصطفى بلقاسم',
                  abre:
                      'https://th.bing.com/th/id/OIP.a_C9v1H7RBbVyFjU4udThgHaKX?pid=ImgDet&rs=1',
                  path: '/cours',
                ),
                module_componant(
                  hei: hei,
                  title: 'الاستاذ بلال يحياوي',
                  abre:
                      'https://th.bing.com/th/id/R.0a4d94b23f386c887f4a2236409edbf9?rik=q09IyvUG6d8ljA&pid=ImgRaw&r=0',
                  path: '/cours',
                ),
              ],
            ),
          ),
        )),
      )),
    );
  }
}
