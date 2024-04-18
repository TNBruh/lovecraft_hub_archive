import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovecrafthub/controllers/literatures.controller.dart';

class DropdownMain extends StatefulWidget {
  const DropdownMain({Key? key}) : super(key: key);

  @override
  _DropdownMainState createState() => _DropdownMainState();
}

class _DropdownMainState extends State<DropdownMain> {
  String dropdownValue = 'Fiction';
  List<String> items = ['Fiction', 'Poetry', 'Essay'];
  final LiteratureController literatureController =
      Get.put(LiteratureController());

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      isExpanded: true,
      items: items.map(
        (String item) {
          return DropdownMenuItem(
            value: item,
            alignment: Alignment.center,
            child: Container(
              child: Text(item),
            ),
          );
        },
      ).toList(),
      onChanged: (String? newValue) {
        literatureController.option.value = newValue!;
        setState(
          () {
            dropdownValue = newValue;
          },
        );
      },
    );
  }
}
