import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/fanworks.controller.dart';
import 'package:lovecrafthub/models/fanwork.model.dart';
import 'dart:developer' as d;
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/appbar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/entry.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/sidebar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/wv.screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CultureScreen extends StatelessWidget {
  final FanworksController fanworksController = Get.put(FanworksController());

  CultureScreen({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   super.initState();
  //   // Enable virtual display.
  //   if (Platform.isAndroid) WebView.platform = AndroidWebView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarGLOBAL(context),
      appBar: AppbarGLOBAL(
        context,
        "Popular Cultures",
        null,
      ),
      body: Container(
        child: Obx(() => entries()),
      ),
    );
  }

  ListView entries() {
    return ListView(
      //list of entries
      children: fanworksController.fanworks.value.map(
        (e) {
          return Entry(
            screen: WV(w: e.webview),
            title: e.title,
            img: e.img,
            subtitle: e.link,
          );
        },
      ).toList(),
    );
  }
}
