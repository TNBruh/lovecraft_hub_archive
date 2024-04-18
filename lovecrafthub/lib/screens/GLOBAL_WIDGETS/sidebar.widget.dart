import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:lovecrafthub/screens/his_life/screen.dart';
import 'package:lovecrafthub/screens/main/screen.dart';
import 'package:lovecrafthub/screens/popular_cultures/screen.dart';

Drawer SidebarGLOBAL(
  BuildContext context,
) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Literatures'),
          onTap: () {
            log("sidebar option pressed", name: "Literatures");
            Navigator.pop(context);
            // Get.offAll(() => MainScreen());
            Get.offAllNamed('/literatures');
          },
        ),
        ListTile(
          title: const Text('Popular Cultures'),
          onTap: () {
            log("sidebar option pressed", name: "Popular Cultures");
            Navigator.pop(context);
            // Get.offAll(() => CultureScreen());
            Get.offAllNamed('/cultures');
          },
        ),
        ListTile(
          title: const Text('His Life'),
          onTap: () {
            log("sidebar option pressed", name: "His Life");
            Navigator.pop(context);
            // Get.offAll(() => BiographyScreen());
            Get.offAllNamed('/his_life');
          },
        ),
        ListTile(
          title: const Text('Most Read Yesterday'),
          onTap: () {
            log("sidebar option pressed", name: "Most Read");
            Navigator.pop(context);
            Get.offAllNamed('/most_read');
          },
        ),
      ],
    ),
  );
}
