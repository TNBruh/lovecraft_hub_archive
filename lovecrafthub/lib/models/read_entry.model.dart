import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadEntry {
  final String title;
  late String? link;
  late WebView? wv;
  late String? imgLink;
  late ImageProvider? img;
  late dynamic numValue;

  ReadEntry(
    this.title, {
    this.link,
    this.imgLink,
    this.img,
    this.numValue,
  }) {
    if (link != null) {
      wv = WebView(initialUrl: link);
    }
    if (imgLink != null) {
      img = NetworkImage(imgLink!);
    }
  }
}
