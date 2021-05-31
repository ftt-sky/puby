import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class CollegeListRefresh extends StatelessWidget {
  final ScrollController scrollController;
  final RefreshController refreshController;

  CollegeListRefresh({Key key, this.scrollController, this.refreshController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Refresh(
      controller: refreshController,
      onLoading: () {},
      onRefresh: () {},
      content: ListView.separated(
          itemBuilder: (context, index) {
            return buildlistItem();
          },
          separatorBuilder: (context, index) {
            return CurrentData().configlineSpace();
          },
          controller: scrollController,
          reverse: false,
          itemCount: 50),
    );
  }

  Widget buildlistItem() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [buildImageWidget(), Gaps.hGap10, _buildListItemInfo()],
      ),
    );
  }

  Widget buildImageWidget() {
    double imageW = 120;
    return Container(
      width: imageW,
      height: imageW / 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: imageW,
              height: imageW / 2,
              child: CacheImage(
                url:
                    'https://img2.woyaogexing.com/2020/03/10/e5cfaf077edb4d4e83465e27aae25795!1080x1920.jpeg',
                borderRadius: BorderRadius.circular(5),
              )),
          Positioned(
              width: 40,
              height: 40,
              left: (imageW - 40) / 2,
              top: (60 - 40) / 2,
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.white,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: Text('data', style: TextStyle(color: Colors.white)),
              ))
        ],
      ),
    );
  }

  Widget _buildListItemInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('data', maxLines: 1, style: TextStyleMacor.bold16Col333),
          Text('data', maxLines: 1, style: TextStyleMacor.nor12col666),
          Gaps.vGap5,
          Text('data', maxLines: 1, style: TextStyleMacor.nor14col333),
        ],
      ),
    );
  }
}
