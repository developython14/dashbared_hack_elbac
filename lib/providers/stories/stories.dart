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
  int __removed_id_stories = 0;
  int get removed_id_stories => __removed_id_stories;
  List get list_stories => _list_stories;
  List get selected_lis =>
      _list_stories.where((element) => element['id'] == _id).toList();
  List get editlis_stoires => _list_stories
      .where((element) => element['id'] == __removed_id_stories)
      .toList();
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

  set_id_for_remove(id) async {
    __removed_id_stories = id;
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
