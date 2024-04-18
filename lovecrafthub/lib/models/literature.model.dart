import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Literature {
  final String name;
  late Widget html;

  Literature(this.name, String content) {
    this.html = Html(
      data: content,
      style: {
        'center': Style(
          textAlign: TextAlign.center,
          alignment: Alignment.center,
        ),
      },
    );
  }

  String get clean_name {
    return name
        .replaceAll('literatures/', '')
        .replaceAll('.fiction', '')
        .replaceAll('.poetry', '')
        .replaceAll('.essays', '')
        .replaceAll('_', ' ')
        .replaceAll('.txt', '');
  }
}
