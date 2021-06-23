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
      case PageIdMacro.purchaseaddress:
        return PurchaseAddressPage(data: data);
        break;
      case PageIdMacro.purchaseadresslist:
        return PurchaseAddressListPage();
        break;
      case PageIdMacro.purchaseaddressnewpage:
        return PurchaseaddressnewPage();
        break;
      case PageIdMacro.purchasedetail:
        return PurchaseDetailPage();
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

class TTPopRoute<T> extends PopupRoute<T> {
  final Duration _duration = Duration(microseconds: 300);
  final double barrierOpacity;
  Widget child;

  TTPopRoute({@required this.child, this.barrierOpacity = 0.5});

  @override
  Duration get transitionDuration => _duration;

  @override
  Color get barrierColor => Color.fromRGBO(0, 0, 0, barrierOpacity);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  AnimationController _animationController;
  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget bottomSheet = MediaQuery.removePadding(
        context: context,
        child: InheritRouteWidget(router: this, child: child));
    return bottomSheet;
  }
}

class InheritRouteWidget extends InheritedWidget {
  final TTPopRoute router;

  InheritRouteWidget({Key key, @required this.router, @required Widget child})
      : super(key: key, child: child);

  static InheritRouteWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritRouteWidget oldWidget) {
    return oldWidget.router != router;
  }
}
