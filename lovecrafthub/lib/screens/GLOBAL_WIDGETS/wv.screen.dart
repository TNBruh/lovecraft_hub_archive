import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class WV extends StatefulWidget {
  final WebView w;
  const WV({required this.w, Key? key}) : super(key: key);

  @override
  _WVState createState() => _WVState();
}

class _WVState extends State<WV> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return widget.w;
  }
}
