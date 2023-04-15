import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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
  Future<void> add_new_contact() async {
    final datatosend = {};
    final url = Uri.parse(Base_url + '/contacts/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    //request.fields.addAll(datatosend);
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    var jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse['message'] == 'login succesfly') {}
    setState(() {});
  }

  getcontact_data() async {
    var test = Uri.parse(Base_url + 'contacts/');
    var response = await http.get(test);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        ref = jsonResponse['results'];
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
                decoration: InputDecoration(hintText: 'icon_url'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
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
              onPressed: () {
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
        appBar: AppBar(
          backgroundColor: Color(0xff3A4750),
          title: Text(
            ' اتصل بنا',
          ),
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
                      onReorder: (oldIndex, newIndex) {},
                      children: ref
                          .map((e) => contact_tile(
                                title: e['title'],
                                icon: e['icon_title'],
                                url_to_show: e['text_to_show'],
                                url_type: e['type_url'],
                                url: e['url'],
                              ))
                          .toList()),
                ),
                ElevatedButton(
                  child: Text('add_new'),
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

class contact_tile extends StatelessWidget {
  contact_tile({
    this.title = '',
    this.icon = '',
    this.url_to_show = '',
    this.url_type = '',
    this.url = '',
    super.key,
  });
  String title;
  String icon;
  String url_to_show;
  String url_type;
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Card(
              child: ListTile(
            onTap: () {
              _launchUrl_url(url_type, url);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(icon),
            ),
            title: Text(url_to_show),
            trailing: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          )),
        ],
      ),
    );
  }
}
