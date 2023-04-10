import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

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
  Future<void> _dialogBuilder_add_stories(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('إنشاء ستوري جديد'),
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
                      children: [
                        contact_tile(
                          title: 'الموقع الإلكتروني ',
                          icon:
                              'https://cdn-icons-png.flaticon.com/512/556/556813.png',
                          url_to_show: 'youtube',
                          url: 'https://www.youtube.com/watch?v=cFi0PfYbEI0',
                          url_type: '',
                        ),
                        contact_tile(
                          title: 'البريد الإلكتروني',
                          icon:
                              'https://cdn-icons-png.flaticon.com/512/556/556813.png',
                          url_to_show: 'S7QURAN-S@hotmail.com',
                          url: 'S7QURAN-S@hotmail.com',
                          url_type: 'mailto:',
                        ),
                        contact_tile(
                          title: 'رقم الهاتف',
                          icon:
                              'https://cdn-icons-png.flaticon.com/512/556/556813.png',
                          url_to_show: '+966-56-302-7472',
                          url: '+966-56-302-7472',
                          url_type: 'tel:',
                        ),
                        contact_tile(
                          title: 'الرسائل القصيرة',
                          icon:
                              'https://cdn-icons-png.flaticon.com/512/556/556813.png',
                          url_to_show: '+966-56-302-7472',
                          url: '+966-56-302-7472',
                          url_type: 'sms:',
                        ),
                        contact_tile(
                          title: 'إنستغرام',
                          icon:
                              'https://th.bing.com/th/id/R.26d9974a1feec9905a4e0d5e5ddf8db6?rik=ycoXFwG5Udz08A&pid=ImgRaw&r=0',
                          url_to_show: 'prof bilal',
                          url: 'https://www.instagram.com/prof.billal.4am/',
                          url_type: '',
                        ),
                      ]),
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
