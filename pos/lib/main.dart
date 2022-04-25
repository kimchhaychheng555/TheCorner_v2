import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const initialSize = Size(1366, 768);
  appWindow.minSize = initialSize;
  appWindow.size = initialSize;
  appWindow.show();

//
  var dir = Directory.current.path;
  var fullPath = "$dir\\cache";
  if (!Directory(fullPath).existsSync()) {
    Directory(fullPath).createSync(recursive: true);
  }
  await GetStorage("setting", fullPath).initStorage;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
