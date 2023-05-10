import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:provider/provider.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class filliers extends StatefulWidget {
  const filliers({Key? key}) : super(key: key);

  @override
  State<filliers> createState() => _filliersState();
}

class _filliersState extends State<filliers> {
  String title = '';
  String abrev = '';
  Future<void> add_new_filliere__() async {
    final url = Uri.parse(Base_url + 'post_filiere/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({
      'order':
          context.watch<contenetproviderd>().selected_filier.length.toString(),
      'title': title,
      'abre': abrev,
      'level_id':
          context.watch<contenetproviderd>().selected_levels_id.toString()
    });
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> _dialogBuilder_cree_un_filliere(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('cree un niveau'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                decoration: InputDecoration(hintText: 'title'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    abrev = value;
                  });
                },
                decoration: InputDecoration(hintText: 'abreveiation'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Confirm '),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => FutureProgressDialog(
                      add_new_filliere__(),
                      message: Text('Loading...')),
                );
              },
            ),
          ],
        );
      },
    );
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
                  children: context
                      .watch<contenetproviderd>()
                      .selected_filier
                      .map(
                        (e) => GestureDetector(
                          key: ValueKey(e['id']),
                          onTap: () {
                            context
                                .read<contenetproviderd>()
                                .setfiliere_id(e['id']);
                            Navigator.pushNamed(context, '/modules');
                          },
                          child: levels_componant(
                            hei: hei,
                            title: e['title'],
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0),
                            abre: e['abre'],
                            path: '/modules',
                          ),
                        ),
                      )
                      .toList(),
                  onReorder: (oldIndex, newIndex) {},
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _dialogBuilder_cree_un_filliere(context);
                      },
                      child: Text('add new filliere')),
                ],
              ),
            ],
          ),
        )),
      )),
    );
  }
}
