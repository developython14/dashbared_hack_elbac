import 'dart:ffi';
import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Storiesproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String _status = 'idle';
  List _list_stories = [];
  int _id = 0;

  List get list_stories => _list_stories;
  String get status => _status;
  int get id => _id;
  Future<void> getallstories() async {
    _list_stories = await getdata();
    _status = 'loaded';

    notifyListeners();
  }

  set_id_Stories(id) async {
    _id = id;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

Future<List> getdata() async {
  var test = Uri.parse(Base_url + 'get_stories');
  var response = await http.get(test);
  List articles = [];
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      articles.add(jsonResponse[i]);
    }
    return articles;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}
