import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? cv;
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

  @override
  Widget build(BuildContext context) {
    var items = [
      Image.network(
          'https://th.bing.com/th/id/OIP.ejJwy93WhLu6uCZ32Y8pCAHaDH?pid=ImgDet&rs=1'),
    ];
    var _items = [1, 2, 3, 4, 5, 6];
    final hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: ReorderableListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int index = 0; index < _items.length; index += 1)
                  storybutton(
                    key: ValueKey(index),
                  ),
              ],
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final int item = _items.removeAt(oldIndex);
                  _items.insert(newIndex, item);
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
                    _dialogBuilder_add_stories(context);
                  },
                  child: Text('إضافة إعلانات جديدة')),
              ElevatedButton(
                  onPressed: () {
                    _dialogBuilder_add_files_to_Stories(context);
                  },
                  child: Text('إضافة عنصر إلى القصص')),
            ],
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الثالثة ثانوي ',
            color: Color.fromARGB(255, 217, 72, 62),
            abre: '3as',
            path: '/filieres',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الثانية  ثانوي ',
            color: Color.fromARGB(255, 210, 227, 24),
            abre: '2as',
            path: '/filieres',
          ),
          levels_componant(
            hei: hei,
            title: 'السنة الأولى   ثانوي ',
            color: Color.fromARGB(255, 222, 46, 175),
            abre: '1as',
            path: '/filieres',
          )
        ],
      ),
    ));
  }
}
