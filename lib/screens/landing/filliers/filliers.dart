import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';

class filliers extends StatefulWidget {
  const filliers({Key? key}) : super(key: key);

  @override
  State<filliers> createState() => _filliersState();
}

class _filliersState extends State<filliers> {
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
            child: ReorderableListView(
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
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                });
              },
            ),
          ),
        )),
      )),
    );
  }
}
