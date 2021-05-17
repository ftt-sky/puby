import 'package:puby/third_page.dart';

import 'package:puby/puby_page.dart';
import 'package:puby/commen/common_index.dart';

class Utils {
  /// 获取图片地址
  static String getImagePath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  // 获取用户登录状态
  static bool isLogin() {
    return ObjectUtil.isNotEmpty(SpUtil.getObject('User'));
  }

  // 是否需要登录
  static bool isNeedLogin(String pageId) {
    if (pageId == PageIdMacro.myId ||
        pageId == PageIdMacro.purchaseId ||
        pageId == PageIdMacro.purchaseId) {
      return true;
    } else {
      return false;
    }
  }
}
