import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/most_read.controller.dart';
import 'package:lovecrafthub/models/literature.model.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/appbar.widget.dart';
import 'dart:developer' as d;

class LiteratureScreen extends StatelessWidget {
  late Literature literature;
  late MostReadController mostReadController = Get.put(MostReadController());

  LiteratureScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    readCheck(context);
    this.literature = Get.arguments;
    // mostReadController.addCount(this.literature);
    d.log(ModalRoute.of(context)!.settings.name!, name: "literature route");
    return Scaffold(
      appBar: AppbarGLOBAL(
        context,
        literature.clean_name,
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: this.literature.html,
      ),
    );
  }

  Future<void> readCheck(BuildContext context) async {
    d.log(ModalRoute.of(context)!.settings.name!, name: "counting time");
    await Future.delayed(const Duration(
      seconds: 30,
      minutes: 2,
    ));
    d.log(ModalRoute.of(context)!.settings.name!, name: "finished counting");
    mostReadController.addCount(this.literature);
  }
}
