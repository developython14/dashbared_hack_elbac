import 'dart:ffi';
import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class contenetproviderd with ChangeNotifier, DiagnosticableTreeMixin {
  String _status = 'idle';
  List _list_contenet = [];
  int _id = 0;
  int _seletced_filliere_id = 0;
  int _seletced_modules_id = 0;
  int _selected_levels_id = 0;

  List get list_contenet => _list_contenet;
  List get selected_filier => _list_contenet
      .where((element) => element['id'] == _selected_levels_id)
      .toList();

  String get status => _status;
  int get id => _id;
  int get selected_fielere_id => _seletced_filliere_id;
  int get selected_modules_id => _seletced_modules_id;
  int get selected_levels_id => _selected_levels_id;

  Future<void> set_levels_id(id) async {
    _selected_levels_id = id;
    notifyListeners();
  }

  Future<void> getallcontenet() async {
    _list_contenet = await getdata();
    _status = 'loaded';
    print('hado homa les levels');
    print(_list_contenet);
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

Future<List> getdata() async {
  var test = Uri.parse(Base_url + 'levels');
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
