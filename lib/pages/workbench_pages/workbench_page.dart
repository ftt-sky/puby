import 'package:flutter/material.dart';
import 'package:puby/pages/workbench_pages/workbench_items.dart';
import 'package:puby/puby_page.dart';

class WorkBenchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkBechPageState();
  }
}

class WorkBechPageState extends State<WorkBenchPage> {
  /// 生命周期
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '工作台',
          style: TextStyleMacor.bold16Col333,
        ),
        actions: [
          IconButton(icon: ImageIconMacro.messageIcon, onPressed: () {})
        ],
      ),
      body: buildChild(),
    );
  }

  /// 创建控件
  ///
  ///

  Widget buildChild() {
    return Container(
        color: ColorsMacro.col_F7F,
        child: ListView(
          children: [
            buildworkbenchBanner(CurrentData.currentImage),
            buildtItemWidget(WorkbenchItem.firstImages()),
            buildtItemWidget(WorkbenchItem.secondImages())
          ],
        ));
  }

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

  /// 触发方法
  ///
  ///

}
