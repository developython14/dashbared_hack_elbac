import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pod_player/pod_player.dart';

class Cours extends StatefulWidget {
  const Cours({Key? key}) : super(key: key);

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 10, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 10, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 10, fontWeight: FontWeight.normal);
  late final PodPlayerController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: 600,
              child: ReorderableListView(
                children: [
                  chaipte(key: ValueKey('fr4ee'), headerStyle: _headerStyle),
                  chaipte(key: ValueKey('fr444ee'), headerStyle: _headerStyle),
                  chaipte(key: ValueKey('fre4444e'), headerStyle: _headerStyle),
                  chaipte(key: ValueKey('free4'), headerStyle: _headerStyle),
                ],
                onReorder: (oldIndex, newIndex) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Main example pag
class chaipte extends StatelessWidget {
  const chaipte({
    Key? key,
    required TextStyle headerStyle,
  })  : _headerStyle = headerStyle,
        super(key: key);

  final TextStyle _headerStyle;
  Future<void> _dialogBuilder_show_students(BuildContext context) {
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
                onTap: () async {},
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

  @override
  Widget build(BuildContext context) {
    return Accordion(
      paddingListBottom: 0,
      paddingListTop: 0,
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        AccordionSection(
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: Colors.blue,
          headerBackgroundColorOpened: Colors.black,
          header: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    _dialogBuilder_show_students(context);
                  },
                  icon: Icon(
                    Icons.school_outlined,
                    color: Color.fromARGB(255, 2, 2, 2),
                  )),
              Text('تعيين كمية المادة عن طريق قياس الناقلية',
                  style: _headerStyle),
            ],
          ),
          content: SizedBox(
            height: 200,
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {},
              children: [
                Row(
                  key: ValueKey('free'),
                  children: [
                    Icon(Icons.play_circle_filled),
                    Text('درس شامل الجزء1'),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_document,
                          color: Colors.grey,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ))
                  ],
                ),
                Row(
                  key: ValueKey('free34'),
                  children: [
                    Icon(Icons.play_circle_filled),
                    Text('درس شامل الجزء1')
                  ],
                ),
                Row(
                  key: ValueKey('fre3333e'),
                  children: [
                    Icon(Icons.play_circle_filled),
                    Text('درس شامل الجزء1')
                  ],
                ),
              ],
            ),
          ),
          contentHorizontalPadding: 1,
          contentBorderWidth: 1,
          // onOpenSection: () => print('onOpenSection ...'),
          // onCloseSection: () => print('onCloseSection ...'),
        ),
      ],
    );
  }
} //__
