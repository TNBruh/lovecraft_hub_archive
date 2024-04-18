import 'dart:convert';
import 'dart:developer' as d;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/models/fanwork.model.dart';

class FanworksController extends GetxService {
  RxList<Fanwork> fanworks = <Fanwork>[].obs;

  @override
  void onInit() async {
    super.onInit();
    readAssets();
  }

  Future<void> readAssets() async {
    d.log("reading assets", name: "culture assets");
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    final String target =
        assets.keys.firstWhere((element) => element.contains('fanworks.link'));
    d.log(target, name: "target json");

    final Map<String, dynamic> mapFanworks =
        jsonDecode(await rootBundle.loadString(target));
    d.log(mapFanworks.toString(), name: "raw json fanworks");

    mapFanworks.forEach(
      (key, value) {
        String title = key;
        String link = value['link'];
        String img = value['image'];

        final Fanwork entry = Fanwork(title, link, img);
        fanworks.add(entry);
      },
    );
    d.log(fanworks.value[0].title, name: 'sample fanwork');
  }
}
