import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/screens/GLOBAL_WIDGETS/wv.screen.dart';
import 'dart:developer' as d;

class Entry extends StatelessWidget {
  final Widget screen;
  final String title;
  final ImageProvider img;
  final String? subtitle;
  const Entry({
    required this.screen,
    required this.title,
    required this.img,
    String? this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // d.log(f.link, name: 'culture entry');
        Get.to(screen);
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 8,
          top: 8,
          left: 8,
          right: 8,
        ),
        height: 84,
        child: Row(
          children: <Widget>[
            Container(
              //entry's image
              child: CircleAvatar(
                backgroundImage: img,
                minRadius: 40,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      //title, i guess
                      alignment: Alignment.topLeft,
                      child: Text(
                        this.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: FontSize.large.size,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    this.subtitle != null
                        ? Container(
                            //the link
                            alignment: Alignment.topLeft,
                            child: Text(
                              this.subtitle!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: FontSize.small.size,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(
            this.title,
          ),
          leading: CircleAvatar(
            foregroundImage: img,
          ),
          subtitle: this.subtitle == null
              ? Container(
                  //the link
                  alignment: Alignment.topLeft,
                  child: Text(
                    this.subtitle!,
                    textAlign: TextAlign.start,
                  ),
                )
              : Container(),
          onTap: () {
            // d.log(f.link, name: 'culture entry');
            Get.to(screen);
          },
        ),
      ),
    );
  }
}
