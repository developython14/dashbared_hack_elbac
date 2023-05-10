import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/modules/componant/module.dart';
import 'package:provider/provider.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class modules extends StatefulWidget {
  const modules({Key? key}) : super(key: key);

  @override
  State<modules> createState() => _modulesState();
}

class _modulesState extends State<modules> {
  String title = '';
  File? cv;

  Future<void> add_new_modules__() async {
    final url = Uri.parse(Base_url + 'post_modules/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({
      'title': title,
      'filiere_id':
          context.watch<contenetproviderd>().selected_fielere_id.toString()
    });
    try {
      final photo = http.MultipartFile.fromBytes(
          'icon_title', await cv!.readAsBytes(),
          filename: cv!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }
    print('hado files');
    print(request.files);
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> _dialogBuilder_cree_un_modules(BuildContext context) {
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
              ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      setState(() {
                        cv = File(result.files.single.path!);
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text('chose icon'))
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
                      add_new_modules__(),
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
    print('hadi');
    print(context.watch<contenetproviderd>().selected_modules);
    print('hadi hya');
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
                      .selected_modules
                      .map((e) => module_componant(
                            key: ValueKey(e['id']),
                            hei: hei,
                            title: e['title'],
                            abre: Base_url + e['icon_title'],
                            path: '/cours',
                          ))
                      .toList(),
                  onReorder: (oldIndex, newIndex) {},
                ),
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('edit modules')),
                  ElevatedButton(
                      onPressed: () {
                        _dialogBuilder_cree_un_modules(context);
                      },
                      child: Text('add new modules')),
                ],
              ),
            ],
          ),
        )),
      )),
    );
  }
}
