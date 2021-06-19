import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../puby_page.dart';

class VideoListWidget extends StatefulWidget {
  final String catId;
  VideoListWidget({this.catId});

  @override
  State<StatefulWidget> createState() {
    return _VideoListWidgetState();
  }
}

class _VideoListWidgetState extends State<VideoListWidget>
    with AutomaticKeepAliveClientMixin {
  /// 属性
  ///
  ///

  ScrollController _scrollController;
  RefreshController _refreshController;

  /// 生命周期
  ///
  ///

  @override
  void initState() {
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Refresh(
        controller: _refreshController,
        onLoading: () {},
        onRefresh: () {},
        content: ListView.separated(
          itemBuilder: (context, index) {
            return _buildListItemWidget();
          },
          separatorBuilder: (context, index) {
            return CurrentData().configlineSpace(height: 1);
          },
          controller: _scrollController,
          reverse: false,
          itemCount: 50,
        ));
  }

  /// 子控制器
  ///
  ///

  // 创建列表item
  Widget _buildListItemWidget() {
    return Container(
      color: ColorsMacro.col_FFF,
      height: 70,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildshipinWidget(),
          _buildTextWidget(),
          _buildPlayButton()
        ],
      ),
    );
  }

  // 创建视频
  Widget _buildshipinWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Gaps.vGap10, ImageIconMacro.shipin],
    );
  }

  // 创建标题
  Widget _buildTextWidget() {
    return Container(
      child: Column(
        children: [
          Gaps.vGap5,
          Container(
            width: SizeMacro().screenWidth - 130,
            height: 40,
            child: Text(
              'data滴滴答答滴滴答答的都是的撒打算大撒大',
              maxLines: 2,
              style: TextStyleMacor.nor16col333,
            ),
          ),
          Text(
            '滴滴答答的',
            maxLines: 1,
            style: TextStyleMacor.nor12col333,
          )
        ],
      ),
    );
  }

  Widget _buildPlayButton() {
    return Container(
        width: 60,
        height: 30,
        child: TextButton(
          onPressed: () {},
          child:
              Text('播放', style: TextStyle(fontSize: 10, color: Colors.orange)),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.orange, width: 1))),
        ));
  }

  /// 触发方法
  ///
  ///

}
