import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/literatures.controller.dart';
import 'package:lovecrafthub/models/literature.model.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/appbar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/sidebar.widget.dart';
import 'package:lovecrafthub/screens/literature/screen.dart';
import 'dart:developer' as d;

import 'package:lovecrafthub/screens/main/widgets/dropdown.widget.dart';

class MainScreen extends StatelessWidget {
  final LiteratureController literatureController =
      Get.put(LiteratureController());

  MainScreen({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    d.log(ModalRoute.of(context)!.settings.name!, name: "main screen route");
    return mainScaffold(context);
  }

  Scaffold mainScaffold(BuildContext context) {
    return Scaffold(
        drawer: SidebarGLOBAL(context),
        appBar: AppbarGLOBAL(
          context,
          "Literatures",
          null,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.black54,
              boxShadow: [
                const BoxShadow(
                  color: Colors.white,
                ),
                const BoxShadow(
                  color: Colors.black,
                  spreadRadius: -2.0,
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Obx(() => primaryContent()),
          ),
        )
        // body: Container(
        //   padding: EdgeInsets.symmetric(
        //   ),
        //   child: Obx(() => primaryContent()),
        // ),
        );
  }

  Column primaryContent() {
    return Column(
      children: <Widget>[
        Center(
          child: imageTop(),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(32, 16, 32, 0),
          child: DropdownMain(),
        ),
        ...entries(),
      ],
    );
  }

  Widget imageTop() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
        top: 16,
      ),
      height: 190,
      width: 190,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("images/hp-lovecraft.png"),
          fit: BoxFit.fitHeight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  List<Widget> entries() {
    String option = '.' + literatureController.option.value.toLowerCase();

    d.log(literatureController.literatures.value.toString(),
        name: "lit widget");

    return literatureController.literatures.value
        .where((element) => element.name.contains(option))
        .map(
      (e) {
        return entry(e);
      },
    ).toList();
  }

  Widget entry(Literature l) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Card(
        child: ListTile(
          title: Text(l.clean_name),
          onTap: () {
            Get.toNamed(
              '/literatures/${l.clean_name.replaceAll(' ', '_')}',
              arguments: l,
            );
          },
        ),
      ),
    );
  }

  // ListView primaryContent() {
  //   return ListView(
  //     children: <Widget>[
  //       Container(
  //         margin: const EdgeInsets.only(
  //           bottom: 16,
  //         ),
  //         height: 190,
  //         width: 190,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           image: DecorationImage(
  //             image: AssetImage("images/hp-lovecraft.png"),
  //             fit: BoxFit.fitHeight,
  //           ),
  //         ),
  //       ),
  //       Container(
  //         alignment: Alignment.center,
  //         margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
  //         child: DropdownMain(),
  //       ),
  //       ...literaturesWidget(),
  //     ],
  //   );
  // }

  // List<Widget> literaturesWidget() {
  //   String option = '.' + literatureController.option.value.toLowerCase();

  //   d.log(literatureController.literatures.value.toString(),
  //       name: "lit widget");

  //   return literatureController.literatures.value
  //       .where((element) => element.name.contains(option))
  //       .map(
  //     (e) {
  //       return literaturesEntry(e);
  //     },
  //   ).toList();
  // }

  // Widget literaturesEntry(Literature l) {
  //   return InkWell(
  //     child: Container(
  //       alignment: Alignment.centerLeft,
  //       height: 48,
  //       padding: EdgeInsets.symmetric(
  //         horizontal: 8,
  //       ),
  //       decoration: BoxDecoration(
  //         border: Border(
  //           bottom: BorderSide(
  //             width: 1,
  //           ),
  //         ),
  //       ),
  //       child: Text(
  //         l.clean_name,
  //         textAlign: TextAlign.justify,
  //         style: TextStyle(
  //           fontSize: 16,
  //         ),
  //       ),
  //     ),
  //     onTap: () {
  //       Get.toNamed(
  //         '/literatures/${l.clean_name.replaceAll(' ', '_')}',
  //         arguments: l,
  //       );
  //     },
  //   );
  // }

  // Widget entry(literature l)
}
