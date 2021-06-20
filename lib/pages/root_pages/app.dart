import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:puby/puby_page.dart';
import 'package:puby/third_page.dart';
import 'tabbar_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildScreenUtilInit();
  }

  // 创建布局适配器
  Widget buildScreenUtilInit() {
    return ScreenUtilInit(
      builder: () => buildRefreshPage(),
      designSize: Size(360, 920),
    );
  }

  // 创建刷新控件
  Widget buildRefreshPage() {
    return RefreshConfiguration(
        footerTriggerDistance: 15,
        headerTriggerDistance: 90,
        maxOverScrollExtent: 100,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (status) {
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: ColorsMacro.col_FFF,
              accentColor: Colors.white,
              highlightColor: Color.fromRGBO(155, 168, 239, 1),
              splashColor: Colors.transparent,
              fontFamily: 'SourceHanSans'),
          builder: (context, child) => Scaffold(
            body: GestureDetector(
              onTap: () {
                hideKeyborad(context);
              },
              child: child,
            ),
          ),
          home: RootAppBar(),
        ));
  }

  // 设置全局 点击空白区域,键盘隐藏
  void hideKeyborad(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  App() {
    clearDiskCachedImages(duration: const Duration(days: 7));
  }
}
