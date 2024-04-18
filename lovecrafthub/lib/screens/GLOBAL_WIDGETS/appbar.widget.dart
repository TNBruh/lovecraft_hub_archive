import 'package:flutter/material.dart';
import 'dart:developer';

AppBar AppbarGLOBAL(
  BuildContext context,
  String title,
  IconButton? leading,
) {
  return AppBar(
    title: Text(title),
    leading: leading,
  );
}
