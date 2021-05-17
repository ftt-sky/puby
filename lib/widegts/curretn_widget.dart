import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/widegts/error_page.dart';

// 加载动画
Widget buildLoadPage() {
  return Center(
    child: Lottie.asset(ImageStringMacro.loadingStr,
        width: 126, fit: BoxFit.cover, alignment: Alignment.center),
  );
}
