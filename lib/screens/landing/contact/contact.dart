import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:future_progress_dialog/future_progress_dialog.dart';

Future<void> _launchUrl_url(type, data) async {
  String url = type + data;
  final Uri url_launcher = Uri.parse(url);
  if (!await launchUrl(url_launcher)) {
    throw 'Could not launch $url_launcher';
  }
}

class contatc extends StatefulWidget {
  const contatc({Key? key}) : super(key: key);

  @override
  State<contatc> createState() => _contatcState();
}

class _contatcState extends State<contatc> {
  List ref = [];
  bool updated_order = false;
  final datatosend = {
    'title': '',
    'type_url': '',
    'url': '',
    'text_to_show': '',
    'order': ''
  };

  File? cv;
  Uint8List? fileBytes;
  String? fileName;

  Future<void> add_new_contact() async {
    final url = Uri.parse('https://servicessaudi.de.r.appspot.com/contacts/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll(datatosend);
    try {
      final photo = http.MultipartFile.fromBytes(
          'icon_title', await cv!.readAsBytes(),
          filename: cv!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }
    print('hadi');
    print(datatosend);

    var push = await request.send();
    var response = await http.Response.fromStream(push);

    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
  }

  Future<void> add_new_contact_web() async {
    final url = Uri.parse('https://servicessaudi.de.r.appspot.com/contacts/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll(datatosend);
    try {
      final photo = http.MultipartFile.fromBytes('icon_title', fileBytes!,
          filename: fileName);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }

    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
  }

  getcontact_data() async {
    var test = Uri.parse(Base_url + 'contacts/');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        ref = jsonResponse['results'];
        datatosend['order'] = (jsonResponse['count'] + 1).toString();
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> _dialogBuilder_add_stories(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('create new contact'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    datatosend['title'] = value;
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
                  child: Text('Icon')),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    datatosend['text_to_show'] = value;
                  });
                },
                decoration: InputDecoration(hintText: 'text_to_show'),
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
                    datatosend['type_url'] = value;
                  });
                },
                decoration: InputDecoration(hintText: 'type_url'),
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
                    datatosend['url'] = value;
                  });
                },
                decoration: InputDecoration(hintText: 'url'),
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
              child: const Text('غلق'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('إضافة '),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => FutureProgressDialog(add_new_contact(),
                      message: Text('Loading...')),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcontact_data();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _dialogBuilder_add_stories(context);
          },
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff3A4750),
          title: Text(
            ' اتصل بنا',
          ),
          actions: [
            updated_order
                ? ElevatedButton(onPressed: () {}, child: Text('save changes'))
                : Text('')
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 800,
                  child: ReorderableListView(
                      onReorder: (int oldIndex, int newIndex) {
                        if (updated_order == false) {
                          setState(() {
                            updated_order = true;
                          });
                        }
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final int item = ref.removeAt(ref[oldIndex]);
                          ref.insert(newIndex, item);
                        });
                      },
                      children: ref
                          .map((e) => contact_tile(
                                id: e['id'].toString(),
                                key: ValueKey(e['created']),
                                title: e['title'],
                                icon: e['icon_title'],
                                url_to_show: e['text_to_show'],
                                url_type: e['type_url'],
                                url: e['url'],
                              ))
                          .toList()),
                ),
                ElevatedButton(
                  child: Text('add'),
                  onPressed: () {
                    _dialogBuilder_add_stories(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class contact_tile extends StatefulWidget {
  contact_tile({
    this.id = '',
    this.title = '',
    this.icon = '',
    this.url_to_show = '',
    this.url_type = '',
    this.url = '',
    super.key,
  });
  String id;
  String title;
  String icon;
  String url_to_show;
  String url_type;
  String url;

  @override
  State<contact_tile> createState() => _contact_tileState();
}

class _contact_tileState extends State<contact_tile> {
  Future<void> remove_contact(id) async {
    final url = Uri.parse(
        'https://servicessaudi.de.r.appspot.com/contacts/' + id + '/');
    var response = await http.delete(url);
    if (response.statusCode == 204) {
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Card(
              child: ListTile(
            onTap: () {
              _launchUrl_url(widget.url_type, widget.url);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.icon),
            ),
            title: Text(widget.url_to_show),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => FutureProgressDialog(
                      remove_contact(widget.id),
                      message: Text('Loading...')),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
