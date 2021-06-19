import 'package:puby/third_page.dart';

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
}

class TelAndSmsService {
  // 电话
  // void call(String number) => launch("tel:$number");
  // // 发短信
  // void sendSms(String number) => launch("sms:$number");
  // // 发邮件
  // void sendEmail(String email) => launch("mailto:$email");
}
