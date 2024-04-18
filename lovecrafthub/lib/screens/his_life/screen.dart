import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/biography.controller.dart';
import 'package:lovecrafthub/models/read_entry.model.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/appbar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/entry.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/sidebar.widget.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/wv.screen.dart';
import 'dart:developer' as d;

class BiographyScreen extends StatelessWidget {
  final BiographyController biographyController =
      Get.put(BiographyController());

  BiographyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    d.log(ModalRoute.of(context)!.settings.name!, name: "biography route");
    return Scaffold(
      drawer: SidebarGLOBAL(context),
      appBar: AppbarGLOBAL(
        context,
        "His Life",
        null,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          padding: EdgeInsets.only(
            top: 16,
            bottom: 8,
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
      ),
    );
  }

  Column primaryContent() {
    return Column(
      children: <Widget>[
        imageTop(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Howard Phillips Lovecraft",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '"The oldest and strongest emotion of mankind is fear, and the oldest and strongest kind of fear is fear of the unknown."',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ...entries(),
      ],
    );
  }

  List<Widget> entries() {
    d.log(biographyController.biographies.value.toString(),
        name: 'biography entries');
    return biographyController.biographies.value.map(
      (e) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Card(
            child: ListTile(
              title: Text(e.title),
              onTap: () {
                Get.to(
                  WV(
                    w: e.wv!,
                  ),
                );
              },
            ),
          ),
        );
      },
    ).toList();
  }

  Widget imageTop() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
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
}
