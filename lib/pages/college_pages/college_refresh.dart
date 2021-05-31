import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:puby/pages/college_pages/college_item.dart';
import 'package:puby/pages/my_pages/my_page.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/widegts/common_base_page.dart';

class CollegePageRefresh extends StatelessWidget {
  final ScrollController scrollController;
  final RefreshController refreshController;

  CollegePageRefresh({this.scrollController, this.refreshController});

  ///  生命周期

  @override
  Widget build(BuildContext context) {
    return Refresh(
      controller: refreshController,
      onLoading: () {
        refreshController.loadComplete();
      },
      onRefresh: () {
        refreshController.refreshCompleted();
      },
      content: ListView.separated(
          // ignore: missing_return
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildBannerWidget(context, CurrentData.currentImage);
            } else if (index == 1) {
              return buildCateWidget();
            } else {
              return buildCateInfoWidget(context);
            }
          },
          separatorBuilder: (context, index) {
            if (index > 1) {
              return CurrentData().configlineSpace(height: 10);
            } else {
              return Container();
            }
          },
          controller: scrollController,
          reverse: false,
          itemCount: 50),
    );
  }

  ///  触发方法

  /// 控件创建

  // 创建轮播图
  Widget configBanner(BuildContext context, List<String> list) {
    return SliverToBoxAdapter(
      child: buildBannerWidget(context, list),
    );
  }

  Widget buildBannerWidget(BuildContext context, List<String> list) {
    final double w = SizeMacro().screenWidth;
    final double h = SizeMacro().screenWidth / 16 * 7;
    if (ObjectUtil.isEmpty(list)) {
      return Container(height: 0.0);
    }

    return Container(
      width: w,
      height: h,
      padding: EdgeInsets.only(top: 0),
      child: Swiper(
        itemCount: list.length,
        autoplay: true,
        viewportFraction: 0.9,
        scale: 0.95,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white.withOpacity(0.5),
              activeColor: Colors.white,
            ),
            margin: EdgeInsets.all(SizeMacro().setWidth(10))),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: CacheImage(
                url: list[index], borderRadius: BorderRadius.circular(10)),
          );
        },
      ),
    );
  }

  // 创建分类
  Widget buildCateWidget() {
    return CollegeItem();
  }

  // 创建分类明细模块
  Widget buildCateInfoWidget(BuildContext context) {
    return buildCollegeCell(context);
  }
}
