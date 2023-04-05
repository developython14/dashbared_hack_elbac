import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
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
