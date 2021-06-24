import 'dart:math';

import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

// ignore: must_be_immutable
class PurchaseHistRefreshPage extends StatefulWidget {
  RefreshController refreshController;
  ScrollController scrollController;
  int type;
  String name;
  PurchaseHistRefreshPage(
      {this.type = 0,
      this.refreshController,
      this.scrollController,
      this.name});
  @override
  State<StatefulWidget> createState() {
    return _PurchaseHistRefreshPageState();
  }
}

class _PurchaseHistRefreshPageState extends State<PurchaseHistRefreshPage> {
  int page = 1;

  /// 生命周期
  ///
  ///

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  /// 网络请求
  ///
  ///

  void loadData(int type) {
    if (page == 1) {}

    if (type == 1) {
      widget.refreshController.refreshCompleted();
    } else {
      widget.refreshController.loadComplete();
    }
  }

  /// 创建子控件
  ///
  ///

  Widget _buildBody() {
    return Container(
      child: Refresh(
        controller: widget.refreshController,
        onLoading: () {
          page++;
          loadData(2);
        },
        onRefresh: () {
          page = 1;
          loadData(1);
        },
        content: ListView.separated(
            controller: widget.scrollController,
            itemBuilder: (context, index) {
              return _buildhistlistItem();
            },
            separatorBuilder: (context, index) {
              return CurrentData().configlineSpace(height: 1);
            },
            itemCount: 50),
      ),
    );
  }

  Widget _buildhistlistItem() {
    int type = Random().nextInt(2);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
              child: Text('2021-06-08 19:00:00',
                  style: TextStyleMacor.nor14col333),
              flex: 2),
          Expanded(
              child: Text('521', style: TextStyleMacor.nor14col333), flex: 1),
          Expanded(
              child: widget.type == 0
                  ? Row(
                      children: [
                        Container(
                            width: (SizeMacro().screenWidth - 20) / 8,
                            child: TextButton(
                                style:
                                    ButtonStyle(alignment: Alignment.topLeft),
                                onPressed: () {},
                                child: Text(type == 0 ? '编辑' : '物流',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 14)))),
                        Container(
                            width: (SizeMacro().screenWidth - 20) / 8,
                            child: TextButton(
                                onPressed: () {
                                  RouteManager.pushPage(
                                      context, PageIdMacro.purchasedetail);
                                },
                                style:
                                    ButtonStyle(alignment: Alignment.topLeft),
                                child: Text('详情',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 14)))),
                      ],
                    )
                  : Container(
                      width: (SizeMacro().screenWidth - 20) / 4,
                      child: TextButton(
                          onPressed: () {
                            RouteManager.pushPage(
                                context, PageIdMacro.purchasedetail);
                          },
                          style: ButtonStyle(alignment: Alignment.topRight),
                          child: Text('详情',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 14)))),
              flex: 1)
        ],
      ),
    );
  }

  /// 触发方法
}
