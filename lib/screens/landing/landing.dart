import 'package:dashboared_hakelbac/screens/landing/opinion/category_faq.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/home.dart';
import 'package:dashboared_hakelbac/screens/landing/comment/comment.dart';
import 'package:dashboared_hakelbac/screens/landing/contact/contact.dart';
import 'package:dashboared_hakelbac/screens/landing/payment/payment.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selected_index = 0;
  String host_image = '';

  List widgets = [contatc(), Home(), payment(), opinion_category()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: drawer_login(),
          ),
          bottomNavigationBar: ConvexAppBar(
            activeColor: Colors.black,
            color: Colors.black,
            backgroundColor: Colors.white,
            height: 56,
            style: TabStyle.react,
            items: [
              TabItem(icon: Icons.contacts, title: 'اتصل بنا'),
              TabItem(icon: Icons.home, title: 'الرئيسية'),
              TabItem(icon: Icons.payment, title: 'طرق الدفع'),
              TabItem(icon: Icons.comment, title: 'آراء '),
            ],
            onTap: (int i) => setState(() {
              selected_index = i;
            }),
          ),
          body: widgets[selected_index],
        ),
      ),
    );
  }
}

class drawer_login extends StatelessWidget {
  const drawer_login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 123, 191, 239),
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th?id=OIF.%2fzwSa5sbkHSYECwO3So00g&pid=ImgDet&rs=1'),
                ),
                Text(
                  'Mustapha belkassem',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          )),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/faq');
              },
              leading: Icon(
                Icons.low_priority_sharp,
                color: Color(0xffF6C90E),
              ),
              title: Text('الأحكام والشروط'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/change_photo');
              },
              leading: Icon(
                Icons.photo_library,
                color: Color(0xffF6C90E),
              ),
              title: Text('تغيير الصورة'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.logout,
                color: Color(0xffF6C90E),
              ),
              title: Text(' تسجيل الخروج'),
            ),
          ),
        ],
      ),
    );
  }
}

class drawer_guess extends StatelessWidget {
  const drawer_guess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 123, 191, 239),
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th?id=OIF.%2fzwSa5sbkHSYECwO3So00g&pid=ImgDet&rs=1'),
                ),
                Text(
                  'User',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          )),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              leading: Icon(
                Icons.account_box,
                color: Color(0xffF6C90E),
              ),
              title: Text('إنشاء حساب'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              leading: Icon(
                Icons.account_box,
                color: Color(0xffF6C90E),
              ),
              title: Text('تسجيل الدخول'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/faq');
              },
              leading: Icon(
                Icons.low_priority_sharp,
                color: Color(0xffF6C90E),
              ),
              title: Text('الأحكام والشروط'),
            ),
          ),
        ],
      ),
    );
  }
}
