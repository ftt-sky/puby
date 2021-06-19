import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_util/sp_util.dart';
import 'package:common_utils/common_utils.dart';

class Global {
  //初始化全局信息
  static Future init(callback) async {
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化本地存储
    await SpUtil.getInstance();
    // 配置输出环境
    LogUtil.init(isDebug: true);
    callback();
    if (Platform.isAndroid) {
      /// 设置状态栏图标和字体的颜色
      /// Brightness.light 一般都是显示白色
      /// Brightness.dart 一般都是显示黑色
      SystemUiOverlayStyle style = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark);

      SystemChrome.setSystemUIOverlayStyle(style);
    }

    callback();
  }
}
