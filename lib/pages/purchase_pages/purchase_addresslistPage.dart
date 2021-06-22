import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/pages/purchase_pages/purchase_itemcurrentwidget.dart';

class PurchaseAddressListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseAddressListPageState();
  }
}

class _PurchaseAddressListPageState extends State<PurchaseAddressListPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar('收货地址'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
        color: ColorsMacro.col_F7F,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return _buildaddressItem();
            },
            separatorBuilder: (context, index) {
              return Container(height: 10);
            },
            itemCount: 5));
  }

  Widget _buildaddressItem() {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        child: Column(
          children: [
            Container(height: 80, child: configaddressItem(type: 1)),
            CurrentData()
                .configlineSpace(height: 1, color: ColorsMacro.col_EEE),
            _buildnormalWidget(Random().nextInt(2))
          ],
        ),
      ),
    );
  }

  Widget _buildnormalWidget(int type) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildmorendizhi(type), _buildbianji(type)],
      ),
    );
  }

  // 配置默认地址
  Widget _buildmorendizhi(int normal) {
    return Container(
      child: Row(
        children: [
          normal == 1
              ? ImageIconMacro.yuanimage
              : ImageIconMacro.huiseyuanimage,
          Gaps.hGap5,
          Text(
            '默认地址',
            style: normal == 1
                ? TextStyleMacor.nor14col333
                : TextStyleMacor.nor12col666,
          )
        ],
      ),
    );
  }

  Widget _buildbianji(int type) {
    return type == 1
        ? Container()
        : Container(
            child: Row(
              children: [
                Container(
                    width: 50,
                    child: InkWell(
                      onTap: () {
                        RouteManager.pushPage(
                            context, PageIdMacro.purchaseaddressnewpage);
                      },
                      child: Row(
                        children: [
                          ImageIconMacro.bianxieimage,
                          Gaps.hGap5,
                          Text(
                            '编辑',
                            style: TextStyle(
                                color: CurrentData.thereColors, fontSize: 14),
                          )
                        ],
                      ),
                    )),
                Gaps.hGap20,
                Container(
                    width: 50,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            Utils.getImagePath(ImageStringMacro.shanchuStr),
                            width: 14,
                            height: 14,
                          ),
                          Gaps.hGap5,
                          Text(
                            '删除',
                            style: TextStyle(
                                color: ColorsMacro.col_999, fontSize: 14),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
  }
}
