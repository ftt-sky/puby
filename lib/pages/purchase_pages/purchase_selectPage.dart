import 'package:flutter/material.dart';
import 'package:puby/models/purchase_model.dart';
import 'package:puby/pages/purchase_pages/purchase_choicePage.dart';
import 'package:puby/pages/purchase_pages/purchase_itemcurrentwidget.dart';
import 'package:puby/puby_page.dart';

class PurchaseSelectPage extends StatefulWidget {
  final List<PurchaseItemModel> data;
  final Function onReload;

  PurchaseSelectPage({this.data, this.onReload});
  @override
  State<StatefulWidget> createState() {
    return _PurchaseSelectPageState();
  }
}

class _PurchaseSelectPageState extends State<PurchaseSelectPage> {
  // 是否全选
  bool isselectAllbtn = true;

  @override
  Widget build(BuildContext context) {
    final route = InheritRouteWidget.of(context).router;
    return AnimatedBuilder(
        animation: route.animation,
        builder: (BuildContext context, Widget child) {
          return CustomSingleChildLayout(
              delegate:
                  WrapLayout(progress: route.animation.value, height: 400),
              child: GestureDetector(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: SizeMacro().screenWidth,
                    child: _bottomBuild(),
                  ),
                ),
              ));
        });
  }

  Widget _bottomBuild() {
    return Container(
      width: SizeMacro().screenWidth,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          _buildTop(),
          CurrentData().configlineSpace(height: 1, color: Colors.grey.shade300),
          _buildlistview(),
          purchaseItemChakan(widget.data, '确认', onTapblock: () {
            RouteManager.pushPage(context, PageIdMacro.purchaseaddress);
          })
        ],
      ),
    );
  }

  // 创建顶部全选
  Widget _buildTop() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              isselectAllbtn = !isselectAllbtn;
              configselectstate();
            },
            child: Container(
              padding: EdgeInsets.only(left: 15),
              width: 80,
              child: Row(
                children: [
                  isselectAllbtn
                      ? ImageIconMacro.yaopinxuanzhongImage
                      : ImageIconMacro.yaopinweixuanzhongImage,
                  Gaps.hGap5,
                  Text('全选', style: TextStyleMacor.nor14col333)
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      '批量修改',
                      style: TextStyle(
                          fontSize: 14, color: CurrentData.thereColors),
                    )),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CurrentData.thereColors),
                      child: Center(
                          child: Text('保存草稿',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white))),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  // 创建选择的商品列表
  Widget _buildlistview() {
    return Expanded(
        child: widget.data.length > 0
            ? MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Container(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return _buildListItem(widget.data[index]);
                        },
                        separatorBuilder: (context, index) {
                          return CurrentData().configlineSpace(
                              height: 1, color: Colors.grey.shade300);
                        },
                        itemCount: widget.data.length)))
            : CommonBasePage(pageState: PageState.emptyDataState));
  }

  Widget _buildListItem(PurchaseItemModel model) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            children: [
              IconButton(
                  icon: model.isselect
                      ? ImageIconMacro.yaopinxuanzhongImage
                      : ImageIconMacro.yaopinweixuanzhongImage,
                  onPressed: () {
                    model.isselect = !model.isselect;
                    configisallselect();
                    setState(() {});
                  }),
              Text('data', style: TextStyleMacor.nor14col333),
              Gaps.hGap5,
              Text('data', style: TextStyleMacor.nor14col666)
            ],
          )),
          Row(
            children: [
              Text('data', style: TextStyle(color: Colors.red, fontSize: 14)),
              NumselectWidget(
                  w: 120,
                  h: 40,
                  type: 1,
                  jishu: model.price,
                  selectnumstr: model.num,
                  onChanged: (e) {
                    if (e == '0.0') {
                      widget.data.remove(model);
                    } else {
                      model.num = e;
                    }
                    setState(() {});
                  }),
              Text('袋', style: TextStyleMacor.nor14col333),
              IconButton(
                  icon: ImageIconMacro.delecteimage,
                  onPressed: () {
                    widget.data.removeWhere((element) {
                      return element == model;
                    });

                    setState(() {});
                  })
            ],
          )
        ],
      ),
    );
  }

  void configisallselect() {
    int num = 0;
    for (var model in widget.data) {
      if (model.isselect) {
        num++;
      }
    }
    if (num == widget.data.length) {
      isselectAllbtn = true;
    } else {
      isselectAllbtn = false;
    }
  }

  // 判断全选
  void configselectstate() {
    for (var model in widget.data) {
      if (isselectAllbtn) {
        model.isselect = true;
      } else {
        model.isselect = false;
      }
    }
    setState(() {});
  }

  // 点击批量修改
  void tappiliangxiugai() {
    // Navigator.of(context, rootNavigator: true).push(
    //     TTPopRoute(child: PurchaseChoicePage(onReload: () {})));
  }

  // 返回上个界面
  void popNavtion() {
    Navigator.pop(context);
    if (widget.onReload != null) {
      widget.onReload();
    }
  }
}
