import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:puby/models/purchase_model.dart';
import 'package:puby/puby_page.dart';

// 创建采购申请底部查看
Widget purchaseItemChakan(List<PurchaseItemModel> data, String text,
    {GestureTapCallback onTapblock}) {
  double itemh = 50 + ScreenUtil().bottomBarHeight;
  int itemlength = 0;
  double allprice = 0;
  for (var model in data) {
    if (model.isselect) {
      itemlength++;
      allprice = allprice + model.price * double.parse(model.num);
    }
  }

  return GestureDetector(
      onTap: () {
        if (onTapblock != null) {
          onTapblock();
        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: ScreenUtil().bottomBarHeight),
        height: itemh,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Gaps.hGap20,
                    Container(
                        width: 55,
                        child: Stack(
                          children: [
                            ImageIconMacro.yiyaoxiangimage,
                            Positioned(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    '$itemlength',
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                              ),
                              top: 0,
                              right: 5,
                            )
                          ],
                        )),
                    Gaps.hGap20,
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: '合计:',
                                style: TextStyleMacor.nor14col333,
                                children: [
                          TextSpan(
                              text: '$allprice',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ])))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                    height: itemh,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        text ?? '查看',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                flex: 1)
          ],
        ),
      ));
}

class PurchaseItemsShuaixuan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseItemsShuaixuanState();
  }
}

class _PurchaseItemsShuaixuanState extends State<PurchaseItemsShuaixuan> {
  var _yaocaivalue = CurrentData.yaocaileixinglist[0];
  var _gongyingshangvalue = CurrentData.gongyingshanglist[0];
  var _changshangvalue = CurrentData.changshangshuaixuanlist[0];
  @override
  Widget build(BuildContext context) {
    return purchaseItemshuaixuan();
  }

  Widget purchaseItemshuaixuan() {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: ColorsMacro.col_EEE,
                offset: Offset(2.0, 2.0),
                blurRadius: .0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          purchaseItemsshuaixuanBtn(ImageIconMacro.yaocaileixingImage, '药材类型',
              CurrentData.yaocaileixinglist, 1, _yaocaivalue),
          purchaseItemsshuaixuanBtn(ImageIconMacro.gongyingshangitemImage,
              '供应商', CurrentData.gongyingshanglist, 2, _gongyingshangvalue),
          purchaseItemsshuaixuanBtn(ImageIconMacro.cangshangImage, '厂商筛选',
              CurrentData.changshangshuaixuanlist, 3, _changshangvalue),
        ],
      ),
    );
  }

  Widget purchaseItemsshuaixuanBtn(
      Image image, String name, List list, int index, String svalue) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildCenter(image, name),
          buildDropdownButtton(list, svalue, index)
        ],
      ),
    );
  }

  Widget buildCenter(Image image, String name) {
    return Expanded(
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          Gaps.hGap5,
          Text(
            name,
            style: TextStyleMacor.nor14col333,
          )
        ],
      ),
    ));
  }

  Widget buildDropdownButtton(List list, String svalue, int index) {
    return Expanded(
        child: DropdownButton(
      value: svalue,
      underline: new Container(),
      selectedItemBuilder: (context) {
        return list
            .map((e) => Text(e,
                style: TextStyle(color: CurrentData.thereColors, fontSize: 13)))
            .toList();
      },
      items: list.map((e) {
        return DropdownMenuItem(child: Text(e), value: e);
      }).toList(),
      onChanged: (value) {
        setState(() {
          if (index == 1) {
            _yaocaivalue = value;
          } else if (index == 2) {
            _gongyingshangvalue = value;
          } else {
            _changshangvalue = value;
          }
        });
      },
    ));
  }
}

// ignore: must_be_immutable
class AddaddressBtn extends StatelessWidget {
  double w;
  double h;
  int type;
  final GestureTapCallback ontap;

  AddaddressBtn({this.w, this.h, this.type = 0, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0),
                blurRadius: 4.0)
          ],
          borderRadius: BorderRadius.circular(type == 0 ? 0 : h / 2),
          color: Colors.white),
      width: w,
      height: h,
      child: InkWell(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Utils.getImagePath(ImageStringMacro.zengjiayStr),
              width: 20,
              height: 20,
            ),
            Gaps.hGap5,
            Text(
              '新增地址',
              style: TextStyleMacor.nor14col333,
            )
          ],
        ),
      ),
    );
  }
}

Widget configaddressItem({
  int type = 0,
  GestureTapCallback onTap,
}) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'data   1311111111',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorsMacro.col_333),
              ),
              type == 0
                  ? InkWell(
                      onTap: onTap,
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
                    )
                  : Container()
            ],
          ),
        ),
        type == 0
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 16,
                    width: 40,
                    child: Text(
                      '默认',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CurrentData.thereColors),
                  ),
                  Gaps.hGap5,
                  Text(
                    '详细地址',
                    style: TextStyleMacor.nor14col333,
                  )
                ],
              )
            : Container(
                child: Row(children: [
                Text(
                  '详细地址',
                  style: TextStyleMacor.nor14col333,
                )
              ]))
      ],
    ),
  );
}
