import 'package:flutter/material.dart';

class DailyReflection extends StatelessWidget {
  const DailyReflection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Image.asset('bg_blue.png'),
      fit: BoxFit.fill,
    );
  }
}
