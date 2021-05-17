import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:puby/pages/college_pages/college_page.dart';
import 'package:puby/pages/my_pages/my_page.dart';
import 'package:puby/pages/patient_pages/patient_page.dart';
import 'package:puby/pages/purchase_pages/purchase_page.dart';
import 'package:puby/pages/workbench_pages/workbench_page.dart';
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
            children: [
              CollegePage(),
              PatientPage(),
              WorkBenchPage(),
              PurchasePage(),
              MyPage()
            ],
          ),
          bottomNavigationBar: buildConvexAppBar(),
        ));
  }

  //
  Widget buildConvexAppBar() {
    return ConvexAppBar(
      items: _tabItmes,
      style: _style,
      curve: _curves,
      backgroundColor: _barColor,
      gradient: _gradient,
      controller: _tabController,
      color: Colors.grey,
      activeColor: Colors.black,
      onTap: (index) {
        debugPrint('select index = $index');
      },
    );
  }
}
