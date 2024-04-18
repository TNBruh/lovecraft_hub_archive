import 'package:get/get.dart';
import 'package:lovecrafthub/models/literature.model.dart';
import 'package:lovecrafthub/models/read_entry.model.dart';
import 'dart:developer' as d;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MostReadController extends GetxService {
  RxList<ReadEntry> mostReads = <ReadEntry>[].obs;
  final provider = ReadProvider();

  @override
  void onInit() async {
    d.log('reading assets', name: '');
    super.onInit();
    readAssets();
  }

  Future<void> readAssets() async {
    d.log('retrieving read counts', name: 'getting data');

    Map<String, dynamic> rawReads = await getData();
    d.log(rawReads.toString(), name: 'raw get');
    rawReads.forEach(
      (key, value) {
        ReadEntry entry = ReadEntry(
          key,
          numValue: value,
        );

        mostReads.add(entry);
      },
    );
    d.log(mostReads.toString(), name: 'most reads');
  }

  Future<void> addCount(Literature l) async {
    Map<String, String> body = {"entry": l.clean_name};
    provider.postRead(body);
  }

  Future<Map<String, dynamic>> getData() async {
    d.log('getting data', name: 'getData()');
    d.log(dotenv.env['URL_PATH'].toString(), name: 'server');
    Response res = await provider.getRead();
    d.log('finished getting data', name: 'getData()');
    d.log(res.body.toString(), name: 'response');
    return res.body;
  }
}

class ReadProvider extends GetConnect {
  Future<Response> getRead() async => get(dotenv.env['URL_PATH'].toString());
  Future<Response> postRead(Map<String, String> body) async => post(
        dotenv.env['URL_PATH'].toString(),
        body,
      );
}
