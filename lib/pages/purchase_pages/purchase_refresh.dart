import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class PurchasePageRefresh extends StatelessWidget {
  final ScrollController scrollController;
  final RefreshController refreshController;

  PurchasePageRefresh({this.scrollController, this.refreshController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Refresh(
      controller: refreshController,
      onLoading: () {
        refreshController.loadComplete();
      },
      onRefresh: () {
        refreshController.refreshCompleted();
      },
      content: ListView.separated(
          itemBuilder: (context, index) {
            return buildPurchaseItem(context);
          },
          separatorBuilder: (context, index) {
            return Container(height: 10, color: ColorsMacro.col_F7F);
          },
          itemCount: 50),
    ));
  }

  // 创建item
  Widget buildPurchaseItem(BuildContext context) {
    return GestureDetector(
        onTap: () {
          RouteManager.pushPage(context, PageIdMacro.purchaseitemId);
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.only(right: 10, left: 10),
          color: ColorsMacro.col_FFF,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildImageAndTitle(), ImageIconMacro.arrowrightIcon],
          ),
        ));
  }

  // 创建图片和文字
  Widget buildImageAndTitle() {
    return Row(
      children: [
        buildImageWidget(),
        Gaps.hGap10,
        buildColumTitles(),
      ],
    );
  }

  // 创建图片
  Widget buildImageWidget() {
    return CacheImage(
        url: CurrentData.imageurl,
        borderRadius: BorderRadius.circular(30.0),
        width: 60.0,
        height: 60.0);
  }

  // 创建titles
  Widget buildColumTitles() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '我的',
            style: TextStyleMacor.bold16Col333,
            textAlign: TextAlign.left,
          ),
          Gaps.vGap5,
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: '上架',
              style: TextStyleMacor.nor14col666,
            ),
            TextSpan(
                text: '333',
                style: TextStyle(
                  color: Colors.red.shade200,
                  fontSize: 14,
                )),
            TextSpan(
              text: '个',
              style: TextStyleMacor.nor14col666,
            ),
            TextSpan(text: '  '),
            TextSpan(text: '发货', style: TextStyleMacor.nor14col666),
            TextSpan(
                text: '10000',
                style: TextStyle(color: Colors.red.shade400, fontSize: 14)),
            TextSpan(text: '件', style: TextStyleMacor.nor14col666)
          ]))
        ],
      ),
    );
  }
}
