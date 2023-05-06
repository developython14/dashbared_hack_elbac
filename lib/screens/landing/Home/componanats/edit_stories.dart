import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:future_progress_dialog/future_progress_dialog.dart';

Future<void> _launchUrl_web(url) async {
  final Uri website = Uri.parse(url);
  if (!await launchUrl(website)) {
    throw 'Could not launch $website';
  }
}

class edit_stories extends StatefulWidget {
  const edit_stories({super.key});

  @override
  State<edit_stories> createState() => _edit_storiesState();
}

class _edit_storiesState extends State<edit_stories> {
  String? new_title;
  Future<void> edit_title_storie() async {
    final url =
        Uri.parse('https://servicessaudi.de.r.appspot.com/put_stories/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({
      'id': context.read<Storiesproviderd>().removed_id_stories.toString(),
      'title': new_title.toString()
    });
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    List ref = context.watch<Storiesproviderd>().editlis_stoires[0]['files'];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (value) {
                    setState(() {
                      new_title = value;
                    });
                  },
                  decoration: InputDecoration(hintText: 'new title'),
                )),
                IconButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) => FutureProgressDialog(
                            edit_title_storie(),
                            message: Text('Loading...')),
                      );
                    },
                    icon: Icon(Icons.send))
              ],
            ),
            Column(
                children: ref
                    .map((e) => Card(
                          child: ListTile(
                            title: TextButton(
                              child: Text(e),
                              onPressed: () {
                                _launchUrl_web(e);
                              },
                            ),
                            dense: true,
                            trailing: IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ))
                    .toList())
          ],
        )),
      ),
    );
  }
}
