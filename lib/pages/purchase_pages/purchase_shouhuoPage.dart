import 'package:flutter/material.dart';
import 'package:puby/pages/purchase_pages/purchase_histRefresh.dart';
import 'package:puby/utils/tabbar_data.dart';

import '../../puby_page.dart';
import 'purchase_itemcurrentwidget.dart';

class PurchaseShouhuoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseShouhuoPageState();
  }
}

class _PurchaseShouhuoPageState extends State<PurchaseShouhuoPage> {
  String selecttype = '待收货采购单';
  List<String> typeList = ['待收货采购单', '已收货采购单'];
  RefreshController refreshController;
  ScrollController scrollController;
  String searchname;

  ///生命周期
  ///
  ///

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScafff();
  }

  /// 控件创建
  ///
  ///
  ///
  Widget _buildScafff() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          configsearch(),
          configshaixuanWidget(),
          CurrentData().configlineSpace(height: 10),
          createhistTipWidget(type: 1),
          CurrentData().configlineSpace(height: 1),
          configlist()
        ],
      ),
    );
  }

  // 创建搜索
  Widget configsearch() {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: SizeMacro().screenWidth,
        height: 56,
        child: CurrentSearchPage(
          hintText: '请输入订单编号',
          onSearch: (e) {
            setState(() {
              searchname = e;
            });
            refreshController.requestRefresh();
          },
        ));
  }

  // 创建筛选条件
  Widget configshaixuanWidget() {
    return Container(
        height: 40,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            DropdownButton(
              underline: Container(),
              value: selecttype,
              items: typeList.map((e) {
                return DropdownMenuItem(
                    child: Text(
                      e,
                      style: TextStyle(
                          color: e == selecttype
                              ? Colors.orange
                              : ColorsMacro.col_333),
                    ),
                    value: e);
              }).toList(),
              onChanged: (value) {
                selecttype = value;
                refreshController.requestRefresh();
                setState(() {});
              },
            ),
          ],
        ));
  }

  // 创建列表
  Widget configlist() {
    return Expanded(
        child: PurchaseHistRefreshPage(
      type: 1,
      refreshController: refreshController,
      scrollController: scrollController,
    ));
  }
}
