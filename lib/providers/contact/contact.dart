import 'dart:ffi';
import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Contactsproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String _status = 'idle';
  List _list_contacts = [];
  int _id = 0;

  List get list_contacts => _list_contacts;
  String get status => _status;
  int get id => _id;
  Future<void> getallcontacts() async {
    _list_contacts = await getdata();
    _status = 'loaded';
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

Future<List> getdata() async {
  var test = Uri.parse(Base_url + 'contacts');
  var response = await http.get(test);
  List articles = [];
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
    jsonResponse = jsonResponse['results'];
    for (var i = 0; i < jsonResponse.length; i++) {
      articles.add(jsonResponse[i]);
    }
    return articles;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
