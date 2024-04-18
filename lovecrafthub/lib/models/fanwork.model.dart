import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Fanwork {
  final String title;
  final String link;
  late WebView webview;
  late NetworkImage img;

  Fanwork(this.title, this.link, String img) {
    webview = WebView(
      initialUrl: link,
    );
    this.img = NetworkImage(img);
  }
}
