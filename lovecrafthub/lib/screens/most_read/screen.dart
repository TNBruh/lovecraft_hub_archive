import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/literatures.controller.dart';
import 'package:lovecrafthub/controllers/most_read.controller.dart';
import 'package:lovecrafthub/models/read_entry.model.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/appbar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/entry.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/sidebar.widget.dart';
import 'dart:developer' as d;

class MostReadScreen extends StatelessWidget {
  final MostReadController mostReadController = Get.put(MostReadController());
  final LiteratureController literatureController =
      Get.find<LiteratureController>();

  MostReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    d.log(
      literatureController.toString(),
      name: 'l controller in most read screen',
    );
    return Scaffold(
      drawer: SidebarGLOBAL(context),
      appBar: AppbarGLOBAL(
        context,
        "Most Read Yesterday",
        null,
      ),
      body: Obx(() => primaryContent()),
    );
  }

  Container primaryContent() {
    return Container(
      child: ListView(
        children: entries(),
      ),
    );
  }

  List<Widget> entries() {
    return mostReadController.mostReads.value.map(
      (e) {
        return entry(e);
      },
    ).toList();
  }

  Widget entry(ReadEntry e) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(e.title),
          leading: CircleAvatar(
            child: Text(
              e.numValue.toString(),
            ),
          ),
          onTap: () {
            String target = e.title.replaceAll(" ", "_");
            var selected = literatureController.literatures.value
                .firstWhereOrNull((element) => element.name.contains(target));

            if (selected == null) return;
            Get.toNamed(
              '/literatures/$target',
              arguments: selected,
            );
          },
        ),
      ),
    );
  }
}
