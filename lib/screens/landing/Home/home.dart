import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/levels.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/story.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = [
      Image.network(
          'https://th.bing.com/th/id/OIP.ejJwy93WhLu6uCZ32Y8pCAHaDH?pid=ImgDet&rs=1'),
    ];
    final hei = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton(),
                storybutton()
              ],
            ),
          ),
          CarouselSlider(
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
