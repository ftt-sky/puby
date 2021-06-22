import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/models/purchase_model.dart';
import 'package:puby/pages/purchase_pages/purchase_itemcurrentwidget.dart';
import 'package:puby/puby_page.dart';

class PurchaseAddressPage extends StatefulWidget {
  final List<PurchaseItemModel> data;
  PurchaseAddressPage({this.data});

  @override
  State<StatefulWidget> createState() {
    return _PurchaseAddressPageState();
  }
}

class _PurchaseAddressPageState extends State<PurchaseAddressPage> {
  // 是否有默认地址
  bool ishavenormaladdress = true;

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar('采购配送信息'),
      body: Container(
        child: _buildbody(),
      ),
    );
  }

  Widget _buildbody() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Column(
                children: [
                  _buildnormalAddress(),
                  CurrentData()
                      .configlineSpace(height: 1, color: ColorsMacro.col_EEE),
                  _buildcaiyoushuoming(),
                  _buildbeizhu()
                ],
              ),
            ),
          ),
          Gaps.vGap20,
          Gaps.vGap20,
          Container(
            height: 40,
            width: SizeMacro().screenWidth - 80,
            child: TextButton(
              onPressed: () {},
              child: Text('确定',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildnormalAddress() {
    return ishavenormaladdress
        ? Container(
            height: 80,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: configaddressItem(onTap: () {
              RouteManager.pushPage(context, PageIdMacro.purchaseadresslist);
            }),
          )
        : Center(
            child: AddaddressBtn(
                h: 40,
                ontap: () {
                  RouteManager.pushPage(
                      context, PageIdMacro.purchaseaddressnewpage);
                }),
          );
  }

  Widget _buildcaiyoushuoming() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 36,
      child: Center(
        child: Row(
          children: [
            ImageIconMacro.yuanimage,
            Gaps.hGap5,
            Text('采购说明:', style: TextStyleMacor.nor14col333)
          ],
        ),
      ),
    );
  }

  Widget _buildbeizhu() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
          color: ColorsMacro.col_F7F,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
          onEditingComplete: () {
            SystemChannels.textInput.invokeMethod("TextInput.hide");
          },
          maxLines: null,
          style: TextStyleMacor.nor14col333,
          decoration: InputDecoration(
            fillColor: ColorsMacro.col_F7F,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            filled: true,
            border: InputBorder.none,
            hintText: '请填写备注信息',
          )),
    );
  }
}
