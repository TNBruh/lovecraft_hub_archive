import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/models/read_entry.model.dart';

class BiographyController extends GetxService {
  RxList<ReadEntry> biographies = <ReadEntry>[].obs;

  @override
  void onInit() async {
    super.onInit();
    readAssets();
  }

  Future<void> readAssets() async {
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    final String target =
        assets.keys.firstWhere((element) => element.contains('biography.link'));

    final Map<String, dynamic> mapBiography =
        jsonDecode(await rootBundle.loadString(target));

    mapBiography.forEach(
      (key, value) {
        final ReadEntry e = ReadEntry(key, link: value);
        biographies.add(e);
      },
    );
  }
}
