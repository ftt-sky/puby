import 'package:puby/third_page.dart';
import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/commen/common_index.dart';
// import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// 获取图片地址
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  // 获取用户登录状态
  static bool isLogin() {
    return ObjectUtil.isNotEmpty(SpUtil.getString(StringMacro.userID));
  }

  // 是否需要登录
  static bool isNeedLogin(String pageId) {
    if ((pageId == PageIdMacro.myId ||
            pageId == PageIdMacro.purchaseId ||
            pageId == PageIdMacro.purchaseId) &&
        !isLogin()) {
      return true;
    } else {
      return false;
    }
  }

  static Widget getSusItem(BuildContext context, String tag,
      {double susHeight = 40}) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}

class TelAndSmsService {
  // 电话
  // void call(String number) => launch("tel:$number");
  // // 发短信
  // void sendSms(String number) => launch("sms:$number");
  // // 发邮件
  // void sendEmail(String email) => launch("mailto:$email");
}
