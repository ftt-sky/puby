import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:puby/pages/college_pages/college_videolist.dart';
import 'package:puby/puby_page.dart';

class CollegeDetailPage extends StatefulWidget {
  String name;
  CollegeDetailPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _CollegeDetailPageState();
  }
}

class _CollegeDetailPageState extends State<CollegeDetailPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabValues = ['简介', '目录', '评价'];

  TabController _controller;

  /// 生命周期
  ///
  ///

  @override
  void initState() {
    _controller = TabController(length: _tabValues.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffo();
  }

  /// 界面搭建
  ///
  ///

  // 配置界面
  Widget _buildScaffo() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyleMacor.bold16Col333,
        ),
      ),
      body: _buildBodyWidget(),
    );
  }

  // 创建 body
  Widget _buildBodyWidget() {
    return Container(
      child: Column(
        children: [
          Gaps.vGap10,
          _buildVideoPlayerWidget(),
          _buildDetailTabBarWidget(),
          _buildDetailTabViewWidget()
        ],
      ),
    );
  }

  // 创建播放器
  Widget _buildVideoPlayerWidget() {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(CurrentData.playerurl));
  }

  // 创建TabBar
  Widget _buildDetailTabBarWidget() {
    return Container(
        height: 46,
        width: SizeMacro().screenWidth,
        child: TabBar(
            labelPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            tabs: _tabValues.map((e) {
              return Text(e);
            }).toList(),
            indicatorPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
            controller: _controller,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: ColorsMacro.col_333,
            unselectedLabelStyle: TextStyle(
                color: ColorsMacro.col_333,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ'),
            indicatorWeight: 2.0,
            labelStyle: TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ')));
  }

  // 创建TabView
  Widget _buildDetailTabViewWidget() {
    return Expanded(
        child: TabBarView(
      controller: _controller,
      children: [
        VideoListWidget(),
        VideoListWidget(),
        VideoListWidget(),
      ],
    ));
  }
}
