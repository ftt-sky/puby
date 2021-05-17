import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeMacro {
  // 屏幕宽
  double screenWidth = ScreenUtil().screenWidth;
  // 屏幕高
  double screenHeight = ScreenUtil().screenHeight;
  // 系统状态栏高度
  double statusBarHeight = ScreenUtil().statusBarHeight;
  // 底部安全举例距离BottomBar高度
  double bottomBarHeight = ScreenUtil().bottomBarHeight;

  // 获取适配  width 宽
  double setWidth(double width) {
    return width.w;
  }

  // 获取适配  height 高
  double setHeight(double height) {
    return height.h;
  }
}

class Dimens {
  static const double font_12 = 12;
  static const double font_14 = 14;
  static const double font_16 = 16;
  static const double font_18 = 18;

  static const double dp5 = 5;
  static const double dp10 = 10;
  static const double dp15 = 15;
  static const double dp20 = 20;
}

class Gaps {
  /// 水平间距
  static Widget hGap5 = SizedBox(width: Dimens.dp5);
  static Widget hGap10 = SizedBox(width: Dimens.dp10);
  static Widget hGap15 = SizedBox(width: Dimens.dp15);
  static Widget hGap20 = SizedBox(width: Dimens.dp20);

  /// 垂直间距
  ///

  static Widget vGap5 = SizedBox(height: Dimens.dp5);
  static Widget vGap10 = SizedBox(height: Dimens.dp10);
  static Widget vGap15 = SizedBox(height: Dimens.dp15);
  static Widget vGap20 = SizedBox(height: Dimens.dp20);
}

/// 颜色宏定义
class ColorsMacro {
  static Color getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(200),
        Random.secure().nextInt(200), Random.secure().nextInt(200));
  }

  static const Color col_333 = Color(0xFF333333);
  static const Color col_FFF = Color(0xFFFFFFFF);
  static const Color col_F6F = Color(0xFFF6F6F6);
  static const Color col_CCC = Color(0xFFCCCCCC);
  static const Color col_FAF = Color(0xFFFAFAFA);
  static const Color col_CDA = Color(0xFFCDA756);
  static const Color col_666 = Color(0xFF666666);
  static const Color col_E5E = Color(0xFFE5E5E5);
  static const Color col_999 = Color(0xFF999999);
  static const Color col_EEE = Color(0xFFEEEEEE);
  static const Color col_D92 = Color(0xFFD92B24);
  static const Color col_F7F = Color(0xFFF7F7F7);
}

// 通用 字体
class TextStyleMacor {
  // 16 粗体 333333
  static TextStyle bold16Col333 = configtextstyle(
      Dimens.font_16, ColorsMacro.col_333,
      font: FontWeight.bold);
  // 14 粗体 333333
  static TextStyle bold14Col333 = configtextstyle(
      Dimens.font_14, ColorsMacro.col_333,
      font: FontWeight.bold);
  // 12 粗体 333333
  static TextStyle bold12Col333 = configtextstyle(
      Dimens.font_12, ColorsMacro.col_333,
      font: FontWeight.bold);
  // 18 正常字体 333333
  static TextStyle nor18col333 =
      configtextstyle(Dimens.font_18, ColorsMacro.col_333);
  // 16 正常字体 333333
  static TextStyle nor16col333 =
      configtextstyle(Dimens.font_16, ColorsMacro.col_333);
  // 16 正常字体 333333
  static TextStyle nor14col333 =
      configtextstyle(Dimens.font_14, ColorsMacro.col_333);
  // 16 正常字体 333333
  static TextStyle nor12col333 =
      configtextstyle(Dimens.font_12, ColorsMacro.col_333);
  // 16 正常字体 666666
  static TextStyle nor16col666 =
      configtextstyle(Dimens.font_16, ColorsMacro.col_666);
  // 14 正常字体 666666
  static TextStyle nor14col666 =
      configtextstyle(Dimens.font_14, ColorsMacro.col_666);
  // 12 正常字体 666666
  static TextStyle nor12col666 =
      configtextstyle(Dimens.font_12, ColorsMacro.col_666);
  // 16 正常字体 999999
  static TextStyle nor16col999 =
      configtextstyle(Dimens.font_16, ColorsMacro.col_999);
  // 14 正常字体 999999
  static TextStyle nor14col999 =
      configtextstyle(Dimens.font_14, ColorsMacro.col_999);
  // 12 正常字体 999999
  static TextStyle nor12col999 =
      configtextstyle(Dimens.font_12, ColorsMacro.col_999);

  // 设置字体
  static TextStyle configtextstyle(double fontsiz, Color color,
      {FontWeight font: FontWeight.normal}) {
    return TextStyle(fontSize: fontsiz, color: color, fontWeight: font);
  }
}
