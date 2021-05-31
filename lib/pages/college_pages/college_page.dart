import 'package:flutter/material.dart';
import 'package:puby/pages/college_pages/college_refresh.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/utils_index.dart';

class CollegePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CollegePageState();
  }
}

class CollegePageState extends State<CollegePage> {
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('学习', style: TextStyleMacor.bold16Col333),
        ),
        body: buildChildWidget());
  }

  Widget buildChildWidget() {
    return Container(
      color: ColorsMacro.col_FFF,
      child: Column(
        children: [buildSearchWidget(), Gaps.vGap10, buildRefresh()],
      ),
    );
  }

  Widget buildRefresh() {
    return Expanded(
        child: CollegePageRefresh(
      scrollController: _scrollController,
      refreshController: _refreshController,
    ));
  }

  // 创建搜索框
  Widget buildSearchWidget() {
    return GestureDetector(
        onTap: () {
          tapsearch();
        },
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
          ),
          height: 36,
          margin: EdgeInsets.only(left: 20, right: 20, top: 0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIconMacro.search,
              Gaps.hGap5,
              Text(
                '大家都在搜\'中医诊断\'',
                style: TextStyleMacor.nor14col666,
              )
            ],
          ),
        ));
  }

  // 点击搜索
  void tapsearch() {}
}
