import 'package:flutter/material.dart';
import 'package:puby/pages/purchase_pages/purchase_itemdetailrefresh.dart';
import 'package:puby/utils/commen_uitils.dart';
import 'package:puby/widegts/curretn_widget.dart';

// ignore: must_be_immutable
class PurchaseItemDetailPage extends StatefulWidget {
  int purchaseid;
  PurchaseItemDetailPage({this.purchaseid});
  @override
  State<StatefulWidget> createState() {
    return _PurchaseItemDetailPageState();
  }
}

class _PurchaseItemDetailPageState extends State<PurchaseItemDetailPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabValues = ['采购申请', '采购历史', '收货管理'];

  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: _tabValues.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: configOrangeAppBar('采购管理'),
      body: _buildBbody(),
    );
  }

  Widget _buildBbody() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [_buildDetailTabBarWidget(), _buildDetailTabViewWidget()],
      ),
    );
  }

  // 创建TabBar
  Widget _buildDetailTabBarWidget() {
    return Container(
        color: Colors.white,
        height: 46,
        width: SizeMacro().screenWidth,
        child: TabBar(
            tabs: _tabValues.map((e) {
              return Container(
                  width: SizeMacro().screenWidth / 4,
                  child: Center(
                    child: Text(e),
                  ));
            }).toList(),
            controller: _controller,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: ColorsMacro.col_333,
            unselectedLabelStyle: TextStyle(
                color: ColorsMacro.col_333,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ'),
            indicatorWeight: 2.0,
            labelStyle: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ')));
  }

  // 创建TabView
  Widget _buildDetailTabViewWidget() {
    return Expanded(
        child: TabBarView(
      controller: _controller,
      children: [
        PurchaseItemDetailRefresh(),
        NumselectWidget(w: 200, h: 40, type: 1, jishu: 150, onChanged: (e) {}),
        Container()
      ],
    ));
  }
}
