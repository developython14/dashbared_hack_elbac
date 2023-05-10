import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:provider/provider.dart';

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
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ReorderableListView(
                  children: context
                      .watch<contenetproviderd>()
                      .selected_filier
                      .map(
                        (e) => levels_componant(
                          key: ValueKey('free'),
                          hei: hei,
                          title: 'علوم تجريبية',
                          color: Colors.green,
                          abre: '3ass',
                          path: '/modules',
                        ),
                      )
                      .toList(),
                  onReorder: (oldIndex, newIndex) {},
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: Text('edit filliere')),
                  ElevatedButton(
                      onPressed: () {}, child: Text('add new filliere')),
                ],
              ),
            ],
          ),
        )),
      )),
    );
  }
}
