import 'package:flutter/material.dart';
import 'package:puby/pages/college_pages/college_list.dart';
import 'package:puby/puby_page.dart';

// ignore: must_be_immutable
class CollegeItem extends StatelessWidget {
  List name = [
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代',
    '测试时代'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = name.map((e) {
      return Chip(
          shadowColor: Colors.grey.shade300,
          elevation: 4,
          label: Text(e,
              style: TextStyleMacor.nor14col666, textAlign: TextAlign.center),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          key: ValueKey<String>(e),
          backgroundColor: ColorsMacro.col_FFF);
    }).toList();

    return InkWell(
      onTap: () {},
      child: _ChipsTile(
        label: 'dd',
        children: chips,
      ),
    );
  }
}

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({Key key, this.label, this.children}) : super(key: key);
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = [];
    cardChildren.add(Wrap(
        children: children.map((Widget chip) {
      return Padding(
          padding: EdgeInsets.only(right: 10, bottom: 10), child: chip);
    }).toList()));

    return Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: cardChildren,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.33, color: ColorsMacro.col_E5E))));
  }
}

// 创建分类推荐
Widget buildCollegeCell(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        buildCollegeitemMore(context),
        buildCollegeItemGridView(context),
        Gaps.vGap10
      ],
    ),
  );
}

// 创建分类更多
Widget buildCollegeitemMore(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    height: 44,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '今日推荐',
          style: TextStyleMacor.bold14Col333,
        ),
        TextButton(
            onPressed: () {
              RouteManager.pushPage(context, PageIdMacro.collegelistId,
                  data: '今日');
            },
            child: Row(
              children: [
                Text(
                  '全部',
                  style: TextStyleMacor.nor12col333,
                ),
                ImageIconMacro.arrowrightIcon
              ],
            ))
      ],
    ),
  );
}

// 创建4宫格
Widget buildCollegeItemGridView(BuildContext context) {
  return GridView(
    padding: EdgeInsets.only(left: 10, right: 10),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.3),
    children: [
      buildCollegeItemGridViewItem(context),
      buildCollegeItemGridViewItem(context),
      buildCollegeItemGridViewItem(context),
      buildCollegeItemGridViewItem(context),
    ],
  );
}

Widget buildCollegeItemGridViewItem(BuildContext context) {
  double itemW = (SizeMacro().screenWidth - 30) / 2.0;
  double itemH = itemW / 2;
  return GestureDetector(
      onTap: () {
        RouteManager.pushPage(context, PageIdMacro.collegeDetailId, data: '今日');
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: itemW,
              height: itemH,
              child: Stack(
                children: [
                  Container(
                      width: itemW,
                      height: itemH,
                      child: CacheImage(
                        url: CurrentData.imageurl,
                        borderRadius: BorderRadius.circular(5),
                      )),
                  Positioned(
                      width: 40,
                      height: 40,
                      left: (itemW - 40) / 2,
                      top: (itemH - 40) / 2,
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Gaps.vGap5,
            Text(
              '测试',
              style: TextStyleMacor.nor12col333,
            ),
            Gaps.vGap5,
            Expanded(child: child)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '免费',
                  style: TextStyleMacor.nor14col333,
                ),
                Text(
                  '共75集',
                  style: TextStyleMacor.nor14col666,
                )
              ],
            )
          ],
        ),
      ));
}
