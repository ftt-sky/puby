import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:puby/puby_page.dart';

class PurchaseDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseDetailPageState();
  }
}

class _PurchaseDetailPageState extends State<PurchaseDetailPage> {
  List<String> nameList = ['采购人', '供应商:', '业务员', '业务员电话', '创建时间', '收货地址', '备注'];
  List<String> titleList = ['成立', '文化', '文化', '文化', '文化', '文化', '文化'];

  /// 生命周期
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  /// 网络请求
  ///
  ///

  /// 构建视图
  ///
  ///

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar('采购详情'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Stack(
        children: [_buildListWidget(), _buildSureBtn()],
      ),
    );
  }

  Widget _buildListWidget() {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildfirstWidget();
          } else if (index == 1) {
            return _buildSecondWidget();
          } else {
            return Container(height: ScreenUtil().bottomBarHeight + 50);
          }
        },
        separatorBuilder: (context, index) {
          return Container(height: 20);
        },
        itemCount: 3);
  }

  Widget _buildfirstWidget() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.orange,
            Colors.orange.shade100,
            Colors.orange.shade50,
            Colors.white
          ])),
      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
      height: 340,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 4.0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildItemWidget(index, nameList[index], titleList[index]);
          },
          itemCount: 7,
        ),
      ),
    );
  }

  Widget _buildSecondWidget() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0),
                blurRadius: 4.0)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 15,
                  color: CurrentData.thereColors,
                ),
                Gaps.hGap5,
                Container(
                  child: Text(
                    '采购信息',
                    style: TextStyleMacor.bold16Col333,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                    child: Text('药品名称', style: TextStyleMacor.nor14col666),
                    flex: 2),
                Expanded(
                    child: Text('采购数量', style: TextStyleMacor.nor14col666),
                    flex: 1),
                Expanded(
                    child: Text('商品总金额', style: TextStyleMacor.nor14col666),
                    flex: 1)
              ],
            ),
          ),
          Container(
            height: 60.0 * 10 + 20,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildCaiyouxinxiItemWidget();
                },
                separatorBuilder: (context, index) {
                  return CurrentData().configlineSpace(height: 1);
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }

  // 创建采购信息 商品信息item
  Widget _buildCaiyouxinxiItemWidget() {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text('艾草', style: TextStyleMacor.nor14col333),
                  flex: 2),
              Expanded(
                  child: Text('50', style: TextStyleMacor.nor14col666),
                  flex: 1),
              Expanded(
                  child: Text('300',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      )),
                  flex: 1)
            ],
          ),
          Gaps.vGap5,
          Container(
            child: Row(
              children: [
                Text('data:', style: TextStyleMacor.nor14col666),
                Gaps.hGap10,
                Text('公司', style: TextStyleMacor.nor14col333)
              ],
            ),
          )
        ],
      ),
    );
  }

  // 创建采购人信息item
  Widget _buildItemWidget(int index, String name, String title) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index == 0
              ? Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: CurrentData.thereColors, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    name,
                    style:
                        TextStyle(fontSize: 14, color: CurrentData.thereColors),
                  ),
                )
              : Center(
                  child: Text(
                    name,
                    style: TextStyleMacor.nor14col666,
                  ),
                ),
          Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: index == 0 ? 16 : 14,
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                  color:
                      index == 0 ? ColorsMacro.col_333 : ColorsMacro.col_666),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSureBtn() {
    return configbuildbottomBtn(name: '删除', onPressed: () {});
  }

  /// 触发方法
  ///
  ///

}
