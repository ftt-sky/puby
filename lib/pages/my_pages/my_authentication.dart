import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/utils_index.dart';

class MyAuthenticationPage extends StatefulWidget {
  final String name;
  MyAuthenticationPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyAuthenticationPageState();
  }
}

class _MyAuthenticationPageState extends State<MyAuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(color: ColorsMacro.col_FFF),
        title: Text(
          widget.name ?? '认证中心',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _buildItems(UserListData.authenList()[index]);
        },
        separatorBuilder: (context, index) {
          return CurrentData().configlineSpace(height: 1);
        },
        itemCount: UserListData.authenList().length);
  }

  Widget _buildItems(UserItem item) {
    return GestureDetector(
      onTap: () {
        RouteManager.pushPage(context, item.pageName);
      },
      child: Container(
        color: Colors.white,
        height: 44,
        width: SizeMacro().screenWidth,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyleMacor.bold14Col333,
            ),
            _buildAuthenticationState()
          ],
        ),
      ),
    );
  }

  Widget _buildAuthenticationState() {
    return Container(
      width: 90,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 3),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.orange]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "未认证",
              style: TextStyle(
                fontSize: 10,
                color: ColorsMacro.col_FFF,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gaps.hGap10,
          ImageIconMacro.arrowrightIcon
        ],
      ),
    );
  }
}
