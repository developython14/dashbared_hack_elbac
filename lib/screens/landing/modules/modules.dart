import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/modules/componant/module.dart';
import 'package:provider/provider.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class modules extends StatefulWidget {
  const modules({Key? key}) : super(key: key);

  @override
  State<modules> createState() => _modulesState();
}

class _modulesState extends State<modules> {
  Future<void> add_new_modules__() async {
    final url = Uri.parse(Base_url + 'post_filiere/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({
      'order':
          context.watch<contenetproviderd>().selected_filier.length.toString(),
      'title': 'title',
      'abre': 'abrev',
      'level_id':
          context.watch<contenetproviderd>().selected_levels_id.toString()
    });
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

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
                height: MediaQuery.of(context).size.height * 0.8,
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
