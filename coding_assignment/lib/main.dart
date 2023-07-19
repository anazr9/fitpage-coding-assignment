import 'package:coding_assignment/app.dart';
import 'package:flutter/material.dart';
import 'package:coding_assignment/core/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}
