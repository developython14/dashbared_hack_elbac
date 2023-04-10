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
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ReorderableListView(
                  children: [
                    module_componant(
                      key: ValueKey('free'),
                      hei: hei,
                      title: 'العلوم الفيزيائية',
                      abre:
                          'https://2as.ency-education.com/uploads/1/0/9/0/1090282/icon-new-english_orig.png',
                      path: '/profs',
                    ),
                    module_componant(
                      key: ValueKey('freeeee'),
                      hei: hei,
                      title: ' العلوم الطبيعية ',
                      abre:
                          'https://2as.ency-education.com/uploads/1/0/9/0/1090282/icon-new-sciences_orig.png',
                      path: '/profs',
                    ),
                  ],
                  onReorder: (oldIndex, newIndex) {},
                ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('edit modules')),
                  ElevatedButton(
                      onPressed: () {}, child: Text('add new modules')),
                ],
              ),
            ],
          ),
        )),
      )),
    );
  }
}
