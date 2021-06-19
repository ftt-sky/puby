import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/tabbar_data.dart';

// 入口tabbar
class RootAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootAppBarState();
  }
}

class _RootAppBarState extends State<RootAppBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  // item 配置项
  var _tabItmes = TabbarData.items(image: true);
  // 字体
  var _style = TabStyle.fixed;
  // 动画
  var _curves = Curves.bounceIn;
  // 背景色
  Color _barColor = Colors.white;
  // 渐变色
  Gradient _gradient = TabbarData.gradients.first;

  TextDirection _textDirection = TextDirection.ltr;

  @override
  void initState() {
    if (_tabController == null) {
      _tabController = TabController(length: _tabItmes.length, vsync: this);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildDirectionality();
  }

  Widget buildDirectionality() {
    return Directionality(
        textDirection: _textDirection,
        child: Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: TabbarData.widgetList(),
          ),
          bottomNavigationBar: buildConvexAppBar(context),
        ));
  }

  //
  Widget buildConvexAppBar(BuildContext context) {
    return ConvexAppBar(
      items: _tabItmes,
      style: _style,
      curve: _curves,
      backgroundColor: _barColor,
      gradient: _gradient,
      controller: _tabController,
      color: Colors.grey,
      activeColor: Colors.black,
      onTabNotify: (index) {
        bool islogin = Utils.isNeedLogin(TabbarData.widgeIdList[index]);
        if (islogin) {
          RouteManager.pushPage(
            context,
            PageIdMacro.loginId,
          );
        }
        return !islogin;
      },
      onTap: (index) {
        debugPrint('select index = $index');
      },
    );
  }
}
