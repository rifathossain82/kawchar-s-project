import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kawchar_project/src/pages/homepage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Kawchar Project",
      home: HomePage(),
    );
  }
}
