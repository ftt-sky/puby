import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class MySliverDelegate extends SliverPersistentHeaderDelegate {
  BuildContext context;
  int userId;
  bool isCraetepage;
  GlobalKey textkey;
  Rect textSize;
  ProfileState profileState;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double maxSharinkOffset = this.maxExtent - this.minExtent;

    double t = (shrinkOffset / maxSharinkOffset).clamp(0.0, 1.0) as double;
    double mt = Tween<double>(begin: 66, end: 0).transform(t);
    double minTop = mt + ScreenUtil().statusBarHeight;
    double imt = Tween<double>(begin: 0.0, end: 12).transform(t);
    double imageTop = minTop - imt;
    double imageLeft = 20;
    double scaleImageValue = Tween<double>(begin: 1, end: 0.6).transform(t);
    double opacity = 1.0 - Interval(0, 1).transform(t);

    double textLeft = imageLeft + 60 + 5;
    textLeft = textLeft - 8 * t; // left

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
                Theme.of(context).highlightColor
              ],
                  tileMode: TileMode.mirror,
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight)),
          child: buildOpacity(opacity),
        ),
        Positioned(
            top: imageTop,
            left: 20,
            child: Transform.scale(
                scale: scaleImageValue,
                child: Container(
                  color: Colors.red,
                  width: 60,
                  height: 60,
                ))),
        Positioned(
          top: imageTop + 10,
          left: textLeft,
          height: 20,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'name',
                //key: textkey,
                style: TextStyleMacor.bold16Col333,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
            },
          ),
        ),
        Positioned(
          top: imageTop + 30,
          left: textLeft,
          height: 20,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'name',
                //key: textkey,
                style: TextStyleMacor.nor14col333,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildOpacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: buildStack(),
    );
  }

  Widget buildStack() {
    return Stack(
      children: [
        buildPositioned(),
      ],
    );
  }

  // 创建分类
  Widget buildPositioned() {
    return Positioned(
      left: 20,
      bottom: 26,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorsMacro.col_FFF, ColorsMacro.col_F6F]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorsMacro.col_EEE,
                  offset: Offset(2.0, 2.0),
                  blurRadius: .0)
            ]),
        width: SizeMacro().screenWidth - 40,
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _createNumTag('积分', '0'),
            _createNumTag('卡券', '0'),
            _createNumTag('礼包', '0'),
          ],
        ),
      ),
    );
  }

  // 创建显示 分类 布局
  Column _createNumTag(String value, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyleMacor.bold16Col333,
          textAlign: TextAlign.center,
        ),
        Gaps.vGap10,
        Text(
          name,
          style: TextStyleMacor.nor14col333,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => SizeMacro().statusBarHeight + 44;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  MySliverDelegate(this.context, this.userId, this.textkey, this.textSize,
      this.profileState, this.isCraetepage) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    //   if (textSize == null) {
    //     textSize = WidgetUtil.getWidgetBounds(textkey.currentContext);
    //   }
    // });
  }
}
