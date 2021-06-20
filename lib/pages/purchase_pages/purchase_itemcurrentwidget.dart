import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:puby/puby_page.dart';

// 创建采购申请底部查看
Widget purchaseItemChakan({GestureTapCallback onTapblock}) {
  double itemh = 50 + ScreenUtil().bottomBarHeight;
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
                                    '2',
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
                              text: '1000',
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
                        '查看',
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
      // height: 100,
      // width: SizeMacro().screenWidth - 40,
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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return Expanded(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
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
          )),
          Expanded(
              child: DropdownButton(
            value: svalue,
            // selectedItemBuilder: (context) {
            //   return list
            //       .map((e) =>
            //           Text(e, style: TextStyle(color: CurrentData.thereColors,fontSize: 13)))
            //       .toList();
            // },
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
          ))
        ],
      ),
    ));
  }
}
