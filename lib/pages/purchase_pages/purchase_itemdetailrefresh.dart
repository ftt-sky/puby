import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class PurchaseItemDetailRefresh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseItemDetailRefreshState();
  }
}

class _PurchaseItemDetailRefreshState extends State<PurchaseItemDetailRefresh> {
  RefreshController _refreshController;

  List<String> data = ['s', 's', 's'];

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Expanded(
      child: Refresh(
        controller: _refreshController,
        onLoading: () {
          _refreshController.loadComplete();
        },
        onRefresh: () {
          _refreshController.refreshCompleted();
        },
        content: ListView.separated(
            itemBuilder: (context, index) {
              return _buildlistitem();
            },
            separatorBuilder: (context, index) {
              return CurrentData().configlineSpace(height: 1);
            },
            itemCount: data.length),
      ),
    );
  }

  Widget _buildlistitem() {
    return Container(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: SizeMacro().screenWidth - 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.vGap5,
                RichText(
                  text: TextSpan(
                      text: '测试',
                      style: TextStyleMacor.nor14col333,
                      children: [
                        TextSpan(
                            text: '    ss',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ))
                      ]),
                ),
                Gaps.vGap5,
                Text(
                  'sss',
                  style: TextStyleMacor.nor14col666,
                ),
                Gaps.vGap5,
                Text(
                  'ssss',
                  style: TextStyleMacor.nor14col666,
                )
              ],
            ),
          ),
          // Container(
          //   width: 100,
          // child:
          NumselectWidget(w: 100, h: 75, type: 0, onChanged: (e) {}),
          // )
        ],
      ),
    );
  }
}
