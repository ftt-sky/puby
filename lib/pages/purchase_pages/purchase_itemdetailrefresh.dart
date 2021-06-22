import 'package:flutter/material.dart';
import 'package:puby/models/model_index.dart';
import 'package:puby/puby_page.dart';
import 'purchase_itemcurrentwidget.dart';
import 'purchase_selectPage.dart';
import 'purchase_choicePage.dart';

class PurchaseItemDetailRefresh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseItemDetailRefreshState();
  }
}

class _PurchaseItemDetailRefreshState extends State<PurchaseItemDetailRefresh> {
  RefreshController _refreshController;
  ScrollController _scrollController;

  final IndexBarController indexBarController = IndexBarController();

  IndexBarDragListener dragListener = IndexBarDragListener.create();
  List<PurchaseItemModel> data = [];
  List<Map> _subList = [];
  // 选中的药品模型
  List<PurchaseItemModel> selectdata = [];
  final _suggestions = <WordPair>[];

  int page = 1;

  @override
  void initState() {
    _refreshController = RefreshController();
    _scrollController = ScrollController();
    dragListener.dragDetails.addListener(_valueChanged);
    super.initState();

    loadData(1);
  }

  @override
  void dispose() {
    super.dispose();
    dragListener.dragDetails.removeListener(_valueChanged);
  }

  // 获取数据
  void loadData(int type) {
    if (page == 1) {
      _suggestions.clear();
      _subList.clear();
      data.clear();
    }

    _suggestions.addAll(generateWordPairs().take(10));
    _suggestions.forEach((element) {
      data.add(PurchaseItemModel.fromJson({'name': element.asSnakeCase}));
    });
    if (type == 1) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.loadComplete();
    }
    print(data.length);
    _handleList(data);
  }

  // 排序
  void _handleList(List<PurchaseItemModel> list) {
    if (list.isEmpty) {
      return;
    }
    for (var i = 0; i < list.length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = list[i].name.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
      if (list[i].isheader) {
        list.removeAt(i);
      }
    }
    print('object $list');
    SuspensionUtil.sortListBySuspensionTag(list);

    for (var i = 0; i < list.length; i++) {
      PurchaseItemModel m = PurchaseItemModel();
      String tag = list[i].tagIndex;
      if (i == 0) {
        m.name = tag;
        m.tagIndex = tag;
        m.isheader = true;
        list.insert(0, m);
      } else if (i < list.length - 1) {
        String nexttag = list[i + 1].tagIndex;
        if (nexttag != tag) {
          m.name = nexttag;
          m.tagIndex = nexttag;
          m.isheader = true;
          list.insert(i + 1, m);
        }
      }
    }

    SuspensionUtil.setShowSuspensionStatus(data);
    setState(() {});
  }

  // 角标点击监听
  void _valueChanged() {
    IndexBarDragDetails details = dragListener.dragDetails.value;
    Map dic = scrollviewIndex(details.tag);
    int subindex = dic['sub'];
    int index = dic['index'];
    if (index == -1) {
      print(details.tag);
    } else {
      double scrolly = (index - subindex) * 75.0 + (subindex + 1) * 40.0;
      if (index == 0) {
        scrolly = 0;
      }
      _scrollController.animateTo(scrolly,
          duration: Duration(microseconds: 500), curve: Curves.ease);
    }
  }

  // 计算下标位置
  Map scrollviewIndex(String tag) {
    int subnum = 0;
    for (var i = 0; i < data.length; i++) {
      PurchaseItemModel model = data[i];
      if (model.isheader) {
        subnum++;
        if (model.name == tag) {
          return {'sub': subnum, 'index': i};
        }
      }
    }
    return {'sub': -1, 'index': -1};
  }

  // 点击查看显示 购物车
  void configtapchakan() {
    Navigator.of(context, rootNavigator: true).push(TTPopRoute(
        child: PurchaseSelectPage(
      data: selectdata,
      onReload: () {
        setState(() {});
      },
    )));
  }

  // 显示选择框
  void configchoice(PurchaseItemModel model) {
    Navigator.of(context, rootNavigator: true).push(TTPopRoute(
        child: PurchaseChoicePage(
            model: model,
            onReload: () {
              if (model.num == '0.0') {
                selectdata.remove(model);
              } else {
                selectdata.removeWhere((element) {
                  return element == model;
                });
                selectdata.add(model);
              }
              setState(() {});
            })));
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: Dimens.dp10,
            child: Container(
              color: ColorsMacro.col_F7F,
            ),
          ),
          PurchaseItemsShuaixuan(),
          _buildStack(),
          purchaseItemChakan(selectdata, '查看', onTapblock: () {
            configtapchakan();
          })
        ],
      ),
    );
  }

  Widget _buildStack() {
    return Expanded(
        child: Stack(children: [
      Refresh(
        controller: _refreshController,
        onLoading: () {
          page++;
          loadData(2);
        },
        onRefresh: () {
          page = 1;
          loadData(1);
        },
        content: ListView.separated(
            controller: _scrollController,
            itemBuilder: (context, index) {
              PurchaseItemModel model = data[index];
              if (model.isheader) {
                return Utils.getSusItem(context, model.getSuspensionTag());
              } else {
                return _buildlistitem(model);
              }
            },
            separatorBuilder: (context, index) {
              return CurrentData().configlineSpace(height: 1);
            },
            itemCount: data.length),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: IndexBar(
          data: kIndexBarData,
          indexBarDragListener: dragListener,
          width: kIndexBarWidth,
          controller: indexBarController,
        ),
      )
    ]));
  }

  Widget _buildlistitem(PurchaseItemModel model) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: SizeMacro().screenWidth - 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.vGap5,
                RichText(
                  text: TextSpan(
                      text: model.name,
                      style: TextStyleMacor.nor14col333,
                      children: [
                        TextSpan(
                            text: '    ss',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ))
                      ]),
                ),
                Gaps.vGap5,
                Text(
                  'sss',
                  style: TextStyleMacor.nor14col666,
                ),
                Gaps.vGap5,
                Text(
                  'ssss',
                  style: TextStyleMacor.nor14col666,
                )
              ],
            ),
          ),
          IconButton(
              icon: ImageIconMacro.gouwucheImage,
              onPressed: () {
                configchoice(model);
              })
          // NumselectWidget(
          //     w: 120,
          //     h: 75,
          //     type: 0,
          //     jishu: model.price,
          //     selectnumstr: model.num,
          //     onChanged: (e) {
          //       if (e == '0.0') {
          //         selectdata.remove(model);
          //       } else {
          //         model.num = e;
          //         selectdata.removeWhere((element) {
          //           return element == model;
          //         });
          //         selectdata.add(model);
          //       }
          //       setState(() {});
          //     }),
        ],
      ),
    );
  }
}
