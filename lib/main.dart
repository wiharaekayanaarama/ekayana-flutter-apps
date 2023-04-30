import 'package:ekayanaarama/src/page/home/home_page.dart';
import 'package:ekayanaarama/src/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return GetMaterialApp(
      initialRoute: '/',
      getPages: RoutePage.pages,
      title: 'Ekayana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Inter",
      ),
      home: const HomePage(),
    );
  }
}
