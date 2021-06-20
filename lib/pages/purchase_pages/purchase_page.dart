import 'package:flutter/material.dart';
import 'package:puby/pages/purchase_pages/purchase_refresh.dart';
import 'package:puby/puby_page.dart';

class PurchasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PurchasePageState();
  }
}

class PurchasePageState extends State<PurchasePage> {
  /// 生命周期
  ///
  ///

  ScrollController _scrollController;
  RefreshController _refreshController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildChildWiedget();
  }

  /// 创建子控件
  ///
  ///

  Widget buildChildWiedget() {
    return Container(
      child: Column(
        children: [
          buildworkbenchBanner(CurrentData.currentImage),
          // buildSearchWidget(),
          Gaps.vGap10,
          buildListRefresh()
        ],
      ),
    );
  }

  // 轮播图
  Widget buildworkbenchBanner(List<String> list) {
    return TTBannerWidget(
      bannerH: SizeMacro().screenWidth / 16 * 7,
      bannerW: SizeMacro().screenWidth,
      padding: EdgeInsets.all(0),
      radius: BorderRadius.circular(0),
      list: list,
      onTap: () {},
    );
  }

  // 创建搜索
  Widget buildSearchWidget() {
    return GestureDetector(
        onTap: () {
          tappurchsearch();
        },
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          height: 36,
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gaps.hGap10,
              ImageIconMacro.search,
              Gaps.hGap5,
              Text(
                '请输入首字母拼音/条形码',
                style: TextStyleMacor.nor14col666,
              )
            ],
          ),
        ));
  }

  Widget buildListRefresh() {
    return PurchasePageRefresh(
      scrollController: _scrollController,
      refreshController: _refreshController,
    );
  }

  /// 触发方法
  ///
  ///
  ///

  // 点击搜索
  void tappurchsearch() {}
}
