import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorToken.gray_0,
      child: Image.asset(
        'asset/drawable/eka_deer.png',
      ),
    );
  }
}
