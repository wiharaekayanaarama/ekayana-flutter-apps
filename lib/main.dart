import 'package:ekayanaarama/src/presentation/modules/home/pages/home_page.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:ekayanaarama/src/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);

    return GetMaterialApp(
      initialRoute: RouteName.home,
      getPages: RoutePage.pages,
      title: 'Ekayana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Inter",
      ),
    );
  }
}
