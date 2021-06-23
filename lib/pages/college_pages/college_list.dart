import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/puby_page.dart';
import 'college_refreshlist.dart';

class CollegeListWidget extends StatefulWidget {
  final name;
  CollegeListWidget({this.name});
  @override
  State<StatefulWidget> createState() {
    return CollegeListWidgetState();
  }
}

class CollegeListWidgetState extends State<CollegeListWidget> {
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
    return buildScaffo();
  }

  Widget buildScaffo() {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.name ?? "",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'SourceHanSans',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: buildChildWidget(),
    );
  }

  // 创建自控制器
  Widget buildChildWidget() {
    return Container(
        color: ColorsMacro.col_FFF,
        child: Column(
          children: [
            Gaps.vGap10,
            CurrentSearchPage(
              hintText: widget.name == '我的收藏' ? '请输入搜索内容/关键字' : '请输入名称/联系人/手机号',
              onSearch: (e) {},
            ),
            Gaps.vGap5,
            CurrentData().configlineSpace(),
            Expanded(
                child: CollegeListRefresh(
              scrollController: _scrollController,
              refreshController: _refreshController,
            ))
          ],
        ));
  }

  // 创建搜索
  Widget buildlistSearch() {
    return Container(
      color: Colors.white,
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.hGap10,
          Container(
              width: SizeMacro().screenWidth - 80,
              height: 36,
              child: CurrentSearchPage(
                hintText:
                    widget.name == '我的收藏' ? '请输入搜索内容/关键字' : '请输入名称/联系人/手机号',
                onSearch: (e) {},
              )),
          buildSearchSureBtn()
        ],
      ),
    );
  }

  // 创建输入框
  Widget buildSearchTextField() {
    return TextField(
        onEditingComplete: () {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
        },
        style: TextStyleMacor.nor14col333,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          fillColor: ColorsMacro.col_F7F,
          filled: true,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,
            color: ColorsMacro.col_666,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMacro.col_EEE, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: widget.name == '我的收藏' ? '请输入搜索内容/关键字' : '请输入名称/联系人/手机号',
          hintStyle: TextStyleMacor.nor14col666,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMacro.col_EEE, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ));
  }

  Widget buildSearchSureBtn() {
    return Container(
        width: 70,
        child: TextButton(
            onPressed: () {},
            child: Text('搜索', style: TextStyleMacor.nor14col333)));
  }
}
