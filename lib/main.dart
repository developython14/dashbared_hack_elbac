import 'package:dashboared_hakelbac/providers/ccp/ccp.dart';
import 'package:dashboared_hakelbac/providers/contact/contact.dart';
import 'package:dashboared_hakelbac/providers/content/content.dart';
import 'package:dashboared_hakelbac/providers/device/device_info.dart';
import 'package:dashboared_hakelbac/providers/stories/pubs.dart';
import 'package:dashboared_hakelbac/providers/stories/stories.dart';
import 'package:dashboared_hakelbac/screens/landing/adminstartion/list_student.dart';
import 'package:dashboared_hakelbac/screens/landing/opinion/accepted.dart';
import 'package:dashboared_hakelbac/screens/landing/opinion/requested.dart';
import 'package:dashboared_hakelbac/screens/landing/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:dashboared_hakelbac/screens/landing/Home/componanats/story.dart';
import 'package:dashboared_hakelbac/screens/landing/change_photo/change_photo.dart';
import 'package:dashboared_hakelbac/screens/landing/cours/cours.dart';
import 'package:dashboared_hakelbac/screens/landing/faq/faq.dart';
import 'package:dashboared_hakelbac/screens/landing/filliers/filliers.dart';
import 'package:dashboared_hakelbac/screens/landing/landing.dart';
import 'package:dashboared_hakelbac/screens/landing/login/login.dart';
import 'package:dashboared_hakelbac/screens/landing/modules/modules.dart';
import 'package:dashboared_hakelbac/screens/landing/profs/profs.dart';
import 'package:dashboared_hakelbac/screens/landing/signup/signup.dart';
import 'package:dashboared_hakelbac/screens/landing/test.dart';
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Storiesproviderd()),
        ChangeNotifierProvider(create: (_) => Pubsproviderd()),
        ChangeNotifierProvider(create: (_) => Contactsproviderd()),
        ChangeNotifierProvider(create: (_) => contenetproviderd()),
        ChangeNotifierProvider(create: (_) => Ccpproviderd()),
        ChangeNotifierProvider(create: (_) => device_infoproviderd()),
      ],
      child: MaterialApp(
        title: 'Bilal_dashboared__',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.cairoTextTheme(
              Theme.of(context).textTheme,
            )),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => splash(),
          '/': (context) => Landing(),
          '/stories': (context) => MoreStories(),
          '/login': (context) => MyLogin(),
          '/signup': (context) => MyRegister(),
          '/filieres': (context) => filliers(),
          '/modules': (context) => modules(),
          '/profs': (context) => profs(),
          '/cours': (context) => Cours(),
          '/faq': (context) => faq(),
          '/requested_opinion': (context) => requested_opinion(),
          '/accepted_opinion': (context) => accepted_opinion(),
          '/change_photo': (context) => change_photo(),
          '/list_students': (context) => list_students(),
        },
      ),
    );
  }
}

// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

