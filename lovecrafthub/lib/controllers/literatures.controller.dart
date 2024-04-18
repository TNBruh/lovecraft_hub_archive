import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer' as d;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/models/literature.model.dart';

class LiteratureController extends GetxController {
  RxList<Literature> literatures = <Literature>[].obs;
  var option = "Fiction".obs;

  @override
  void onInit() async {
    super.onInit();
    await readAssets();
  }

  Future<void> readAssets() async {
    d.log("reading assets", name: 'read assets 0');
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    d.log(assets.keys.toString(), name: 'sample key');
    d.log(assets.values.last.toString(), name: 'sample value');

    d.log("assets read", name: 'read assets 1');
    Iterable<String> literatures =
        assets.keys.where((element) => element.contains('literatures'));
    // String content = await rootBundle.loadString(literatures.first);

    // int initCount = this.literatures.value.length;
    // int assetCount = literatures.length;
    // d.log(initCount.toString(), name: 'initCount');
    // d.log(assetCount.toString(), name: 'assetCount');
    // if (assetCount == initCount) return;

    literatures.forEach(
      (element) async {
        try {
          // d.log(element, name: 'reading files');
          String content = await rootBundle.loadString(element);
          // d.log('finished reading file', name: 'read content');
          Literature literatureEntry = Literature(element, content);
          // d.log('appending entry', name: 'populate literatures');
          this.literatures.add(literatureEntry);
        } catch (e) {
          d.log(e.toString(), name: 'error reading file');
        }
      },
    );
  }
}
