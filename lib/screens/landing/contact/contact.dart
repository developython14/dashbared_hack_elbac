import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart';

final Uri _url_email =
    Uri.parse('mailto: S7QURAN-S@hotmail.com?subject=help&body=New%question');
final Uri website = Uri.parse('https://rightservices.herokuapp.com/');
final Uri _url_phone = Uri.parse('tel:+966-563027472');
final Uri _url_sms = Uri.parse('sms:+966-563027472');

Future<void> _launchUrl_email() async {
  if (!await launchUrl(_url_email)) {
    throw 'Could not launch $_url_email';
  }
}

Future<void> _launchUrl_phone() async {
  if (!await launchUrl(_url_phone)) {
    throw 'Could not launch $_url_phone';
  }
}

Future<void> _launchUrl_web() async {
  if (!await launchUrl(website)) {
    throw 'Could not launch $website';
  }
}

Future<void> _launchUrl_sms() async {
  if (!await launchUrl(_url_sms)) {
    throw 'Could not launch $_url_sms';
  }
}

class contatc extends StatelessWidget {
  const contatc({Key? key}) : super(key: key);

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
                Text('الموقع الإلكتروني'),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_web,
                  leading: Icon(Icons.web),
                  title: Text('RightServices.com'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  'البريد الإلكتروني',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_email,
                  leading: Icon(Icons.email),
                  title: Text('S7QURAN-S@hotmail.com'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  'رقم الهاتف',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_phone,
                  leading: Icon(Icons.phone),
                  title: Text('+966-56-302-7472'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  'الرسائل القصيرة',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_sms,
                  leading: Icon(Icons.sms),
                  title: Text('+966-56-302-7472'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  'الرسائل القصيرة',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_sms,
                  leading: Icon(Icons.facebook),
                  title: Text('الأستاذ بلال'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  ' إنستغرام',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_sms,
                  leading: Icon(Icons.facebook_outlined),
                  title: Text('الأستاذ بلال'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
                Text(
                  ' واتس اب  ',
                ),
                Card(
                    child: ListTile(
                  onTap: _launchUrl_sms,
                  leading: Icon(Icons.facebook_outlined),
                  title: Text('الأستاذ بلال'),
                  trailing: Icon(Icons.arrow_forward_ios),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
