import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puby/puby_page.dart';
import 'my_secondorder.dart';

class MyorderPage extends StatefulWidget {
  final String name;
  MyorderPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyorderPageState();
  }
}

class _MyorderPageState extends State<MyorderPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabValues = ['商品订单', '视频订单'];

  /// 生命周期
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return DefaultTabController(
        length: _tabValues.length,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.orange,
              leading: BackButton(color: ColorsMacro.col_FFF),
              title: _buildDetailTabBarWidget()),
          body: _buildDetailTabViewWidget(),
        ));
  }

  // 创建TabBar
  Widget _buildDetailTabBarWidget() {
    return TabBar(
        labelPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        tabs: _tabValues.map((e) {
          return Tab(text: e);
        }).toList(),
        indicatorPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: ColorsMacro.col_E5E,
        unselectedLabelStyle: TextStyle(
            color: ColorsMacro.col_E5E,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'FZDaLTJ'),
        indicatorWeight: 2.0,
        labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'FZDaLTJ'));
  }

  // 创建TabView
  Widget _buildDetailTabViewWidget() {
    return TabBarView(
      children: [
        OrderSecondPage(index: 0),
        Container(
          color: ColorsMacro.getRandomColor(),
        ),
      ],
    );
  }
}
