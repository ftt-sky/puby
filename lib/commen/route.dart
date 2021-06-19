import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puby/commen/macro.dart';
import 'package:puby/pages/my_pages/my_authdoctorinfo.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/pages/page_index.dart';

class RouteManager {
  /*
  跳到指定界面 带返回按钮
  安卓风格
  */
  static pushPage(BuildContext context, String pageName, {data}) {
    Navigator.push(context, configRouteStr(pageName, data: data));
  }

  /*
  跳转指定界面 带返回按钮
  IOS 风格
  */
  static pushCuperPage(BuildContext context, String pageName, {data}) {
    Navigator.push(context, configCuPerPageRoute(pageName, data: data));
  }

  // 获取带路由的安卓风格 page
  static Route<dynamic> configRouteStr(String name, {data}) {
    return MaterialPageRoute(
        builder: (_) => configCurrentWidget(name, data: data));
  }

  // 获取带路由的IOS风格 page
  static Route<dynamic> configCuPerPageRoute(String name, {data}) {
    return CupertinoPageRoute(
        builder: (_) => configCurrentWidget(name, data: data));
  }

  static void pushcustonPage(BuildContext context, String pagename,
      {bool needLogin = false, data}) {
    if (context == null || pagename == null) {
      return;
    }
    if (needLogin && !Utils.isLogin()) {
      pushcustonPage(context, pagename, data: data);
      return;
    }
    pushPage(context, pagename, data: data);
  }

  static Widget configCurrentWidget(String name, {data}) {
    switch (name) {
      case PageIdMacro.tabbarId:
        return App();
        break;
      case PageIdMacro.collegeId:
        return CollegePage();
        break;
      case PageIdMacro.collegelistId:
        return CollegeListWidget(name: data);
        break;
      case PageIdMacro.collegeDetailId:
        return CollegeDetailPage(name: data);
      case PageIdMacro.patientId:
        return PatientPage();
        break;
      case PageIdMacro.workbenchId:
        return WorkBenchPage();
        break;
      case PageIdMacro.purchaseId:
        return PurchasePage();
        break;
      case PageIdMacro.purchaseitemId:
        return PurchaseItemDetailPage();
        break;
      case PageIdMacro.myId:
        return MyPage();
        break;
      case PageIdMacro.myodercenter:
        return MyorderPage(name: data);
        break;
      case PageIdMacro.myauthentication:
        return MyAuthenticationPage();
        break;
      case PageIdMacro.myauthmech:
        return MyAuthmechPage(name: data);
        break;
      case PageIdMacro.myauthpay:
        return MyAuthPayPage(name: data);
        break;
      case PageIdMacro.myauthdoctor:
        return MyAuthDoctorPage(name: data);
        break;
      case PageIdMacro.myauthdoctorinfo:
        return MyAuthDoctorInfoPage();
        break;
      case PageIdMacro.mycollection:
        return CollegeListWidget(name: data);
      case PageIdMacro.myprize:
        return MyprizePage(name: data);
        break;
      case PageIdMacro.mycostomer:
        return MycustomerPage(
          name: data,
        );
        break;
      case PageIdMacro.myfeedback:
        return MyFeedBackPage(name: data);
        break;
      case PageIdMacro.mysett:
        return MySetPage(name: data);
        break;
      case PageIdMacro.loginId:
        return LoginPage();
        break;
      default:
        return App();
        break;
    }
  }
}
