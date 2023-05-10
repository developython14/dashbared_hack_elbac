import 'package:dashboared_hakelbac/host/base_url.dart';
import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:dashboared_hakelbac/providers/stories/pubs.dart';
import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

Future<void> _launchUrl_web(url) async {
  final Uri website = Uri.parse(url);
  if (!await launchUrl(website)) {
    throw 'Could not launch $website';
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String pub_link = '';
  String story_name_to_insert = '';
  File? story_garde_to_insert;
  List<File>? files_stories_added;
  File? cv;
  String new_name_niveau = '';
  String new_abrev = '';

  Future<void> add_new_niveau() async {
    final url = Uri.parse(Base_url + 'post_level/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({
      'title': new_name_niveau,
      'abre': new_abrev,
      'order':
          context.watch<contenetproviderd>().list_contenet.length.toString()
    });
    try {
      final photo = http.MultipartFile.fromBytes(
          'image', await cv!.readAsBytes(),
          filename: cv!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }

    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> add_new_niveau__() async {
    final url = Uri.parse(Base_url + 'post_level/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({'url': pub_link});
    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> add_new_story() async {
    final url = Uri.parse(Base_url + 'post_stories/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({'title': story_name_to_insert, 'order': '2'});
    try {
      final photo = http.MultipartFile.fromBytes(
          'page_de_gard', await story_garde_to_insert!.readAsBytes(),
          filename: story_garde_to_insert!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }
    for (var el in files_stories_added!) {
      try {
        final photo = http.MultipartFile.fromBytes(
            el.toString(), await el!.readAsBytes(),
            filename: el!.path.split("/").last);
        request.files.add(photo);
      } catch (e) {
        print('KAYN ERROR');
        print(e);
      }
    }

    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

  Future<void> remove_story(id) async {
    final url = Uri.parse('https://servicessaudi.de.r.appspot.com/post_pubs/');
    var request = http.MultipartRequest('POST', url);
    final headers = {'Content-type': 'multipart/form-data'};
    request.headers.addAll(headers);
    request.fields.addAll({'url': pub_link});
    try {
      final photo = http.MultipartFile.fromBytes(
          'image', await cv!.readAsBytes(),
          filename: cv!.path.split("/").last);
      request.files.add(photo);
    } catch (e) {
      print('KAYN ERROR');
      print(e);
    }

    var push = await request.send();
    var response = await http.Response.fromStream(push);
    print(response.body);

    var jsonResponse = convert.jsonDecode(response.body);
  }

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
                onChanged: (value) {
                  setState(() {
                    story_name_to_insert = value;
                  });
                },
                decoration: InputDecoration(hintText: 'اسم ستوري'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    setState(() {
                      story_garde_to_insert = File(result.files.single.path!);
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('story gard'),
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    setState(() {
                      files_stories_added =
                          result.paths.map((path) => File(path!)).toList();
                    });
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('انقر هنا لإضافة ملفات'),
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
                  builder: (context) => FutureProgressDialog(add_new_story(),
                      message: Text('Loading...')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_add_files_to_Stories(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('تحرير القصص'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                  hint: Text(
                    'chose role',
                    style: TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text('اختر القصص التي تريد تخصيصها '),
                      value: 'expert',
                    ),
                    DropdownMenuItem(
                      child: Text('freede'),
                      value: 'user',
                    )
                  ],
                  onChanged: (value) {}),
              TextFormField(
                decoration: InputDecoration(hintText: 'اسم جديد ستوري'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    setState(() {});
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('انقر هنا لإضافة ملفات'),
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
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red),
              child: const Text('حذف هذه القصص '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_adpublicite(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('cree un publicite'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    pub_link = value;
                  });
                },
                decoration: InputDecoration(hintText: 'Link of redirection'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              GestureDetector(
                onTap: () async {
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
                child: Text('Put image that show in slide'),
              ),
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
                  builder: (context) => FutureProgressDialog(add_new_niveau(),
                      message: Text('Loading...')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_editpublicite(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' edit pub'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                  hint: Text(
                    'chose role',
                    style: TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text('chose the pub'),
                      value: 'expert',
                    ),
                    DropdownMenuItem(
                      child: Text('freede'),
                      value: 'user',
                    )
                  ],
                  onChanged: (value) {}),
              TextFormField(
                decoration:
                    InputDecoration(hintText: 'New link of redirection'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    setState(() {});
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text('Put here the new Image'),
              ),
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
              child: const Text('confirm '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red),
              child: const Text('remove this pub'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_cree_un_niveau(BuildContext context) {
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
                    new_name_niveau = value;
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
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    new_abrev = value;
                  });
                },
                decoration: InputDecoration(hintText: 'abreveiation'),
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
                  builder: (context) => FutureProgressDialog(add_new_niveau(),
                      message: Text('Loading...')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilder_edit_niveau(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' edit Niveau'),
          content: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                  hint: Text(
                    'chose niveau',
                    style: TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text('chose the pub'),
                      value: 'expert',
                    ),
                    DropdownMenuItem(
                      child: Text('freede'),
                      value: 'user',
                    )
                  ],
                  onChanged: (value) {}),
              TextFormField(
                decoration: InputDecoration(hintText: 'New Name'),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'New arev'),
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
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('confirm '),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.red),
              child: const Text('remove this pub'),
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
    var items = context
        .watch<Pubsproviderd>()
        .list_pubs
        .map(
          (e) => GestureDetector(
            onTap: () {
              _launchUrl_web(e['url']);
            },
            child: Image.network(
                'https://storage.googleapis.com/bacdz/' + e['image_de_garde']),
          ),
        )
        .toList();
    final hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: ReorderableListView(
              scrollDirection: Axis.horizontal,
              children: context
                  .watch<Storiesproviderd>()
                  .list_stories
                  .map((e) => storybutton(
                        key: ValueKey(e['id']),
                        title: e['title'],
                        cover_image: e['page_de_garde'] == ''
                            ? e['files'][0]
                            : 'https://storage.googleapis.com/bacdz/' +
                                e['page_de_garde'],
                        id: e['id'],
                      ))
                  .toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final int item = context
                      .watch<Storiesproviderd>()
                      .list_stories
                      .removeAt(oldIndex);
                  context
                      .watch<Storiesproviderd>()
                      .list_stories
                      .insert(newIndex, item);
                });
              },
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_add_stories(context);
                  },
                  child: Text('إنشاء ستوري جديد')),
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_add_files_to_Stories(context);
                  },
                  child: Text('إضافة عنصر إلى القصص')),
            ],
          ),
          Container(
            height: 300,
            child: CarouselSlider(
                items: items,
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_adpublicite(context);
                  },
                  child: Text('إضافة إعلانات جديدة')),
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_editpublicite(context);
                  },
                  child: Text(' تحرير في الإعلان ')),
            ],
          ),
          SizedBox(
            height: 800,
            child: ReorderableListView(
              children: context
                  .watch<contenetproviderd>()
                  .list_contenet
                  .map((e) => levels_componant(
                        key: ValueKey(e['id']),
                        hei: hei,
                        title: e['title'],
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                        abre: e['abre'],
                        path: '/filieres',
                      ))
                  .toList(),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  //final int item = _items.removeAt(oldIndex);
                  //_items.insert(newIndex, item);
                });
              },
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_cree_un_niveau(context);
                  },
                  child: Text('إنشاء مستوى  جديد')),
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_edit_niveau(context);
                  },
                  child: Text('مخصصة لمستوى')),
            ],
          ),
        ],
      ),
    ));
  }
}
