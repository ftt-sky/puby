import 'package:flutter/material.dart';

import '../../puby_page.dart';
import 'purchase_itemcurrentwidget.dart';
import 'purchase_histRefresh.dart';

class PurchaseHistPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseHistPageState();
  }
}

class _PurchaseHistPageState extends State<PurchaseHistPage> {
  RefreshController refreshController;
  ScrollController scrollController;

  /// 生命周期
  ///
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
          createhistTipWidget(),
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
          onSearch: (e) {},
        ));
  }

  // 创建筛选条件
  Widget configshaixuanWidget() {
    return createslisihaixuanWidget(onTap: () {});
  }

  // 创建列表
  Widget configlist() {
    return Expanded(
        child: PurchaseHistRefreshPage(
      scrollController: scrollController,
      refreshController: refreshController,
    ));
  }

  /// 触发方法
  ///
  ///
}
