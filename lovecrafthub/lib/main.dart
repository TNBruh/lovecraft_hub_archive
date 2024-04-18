import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lovecrafthub/controllers/literatures.controller.dart';
import 'package:lovecrafthub/screens/his_life/screen.dart';
import 'package:lovecrafthub/screens/literature/screen.dart';
import 'package:lovecrafthub/screens/main/screen.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as d;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/screens/most_read/screen.dart';
import 'package:lovecrafthub/screens/popular_cultures/screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  d.log(dotenv.env['URL_PATH'].toString(), name: 'path');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MainScreen(),
      initialRoute: '/literatures',
      getPages: [
        GetPage(
          name: '/literatures',
          page: () => MainScreen(),
        ),
        GetPage(
          name: '/literatures/:title',
          page: () => LiteratureScreen(),
        ),
        GetPage(
          name: '/his_life',
          page: () => BiographyScreen(),
        ),
        GetPage(
          name: '/cultures',
          page: () => CultureScreen(),
        ),
        GetPage(
          name: '/most_read',
          page: () => MostReadScreen(),
        ),
      ],
    );
  }
}

Future<void> initServices() async {
  d.log('initializing', name: "init 0");
  d.log('initialized', name: "init 1");
}
