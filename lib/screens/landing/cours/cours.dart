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
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  late final PodPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo('807698541'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
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
            child: Column(
              children: [
                PodVideoPlayer(controller: controller),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('حمل ملف الملخص الشامل من هنا')),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
                chaipte(headerStyle: _headerStyle),
              ],
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
          headerBackgroundColor: Colors.red,
          headerBackgroundColorOpened: Colors.black,
          header: Text('تعيين كمية المادة عن طريق قياس الناقلية',
              style: _headerStyle),
          content: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.play_circle_filled),
                  Text('درس شامل الجزء1')
                ],
              ),
              Row(
                children: [
                  Icon(Icons.play_circle_filled),
                  Text('درس شامل الجزء1')
                ],
              ),
              Row(
                children: [
                  Icon(Icons.play_circle_filled),
                  Text('درس شامل الجزء1')
                ],
              ),
            ],
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
