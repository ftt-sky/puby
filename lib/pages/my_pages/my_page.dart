import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/tool_index.dart';
import 'package:puby/widegts/curretn_widget.dart';
import 'package:puby/widegts/error_page.dart';

final profileProvider = Provider.family<PrifileViewModel, int>(
    (ref, userId) => PrifileViewModel(userId));

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends State<MyPage> {
  var _userId;
  @override
  Widget build(BuildContext context) {
    if (Utils.isLogin()) {
      _userId = SpUtil.getObject(StringMacro.userID)['id'];
    }
    return buildScaffold(context);
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsMacro.col_F7F,
        body: buildCustomScrollview(context));
  }

  Widget buildConsumer(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final profileState = watch(profileProvider(_userId)).state;
      if (profileState.pageState == PageState.busyState ||
          profileState.pageState == PageState.initializedState) {
        return buildLoadPage();
      }

      if (profileState.pageState == PageState.errorState) {
        return ErrorPage(
          title: profileState.error is NeedLogin
              ? '😮 你竟然忘记登录 😮'
              : profileState.error.message,
          buttonAction: () {},
          buttonText: profileState.error is NeedLogin ? '登录' : null,
        );
      }

      return buildNestedScrllView(context);
    });
  }

  Widget buildNestedScrllView(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: false,
      body: buildCustomScrollview(context),
      // ignore: missing_return
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {},
    );
  }

  // 创建
  Widget buildCustomScrollview(BuildContext context) {
    return Builder(builder: (context) {
      return CustomScrollView(
        slivers: [
          // SliverPadding(
          //     padding: EdgeInsets.only(top: 0),
          //     sliver: SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //             (BuildContext context, int index) {
          //       UserItem item = UserListData.firstItem()[index];
          //       return buildItemWidget(item.icon, item.name);
          //     }, childCount: UserListData.firstItem().length))),
          buildSliverFixedExtenList(UserListData.firstItem()),
          SliverPadding(padding: EdgeInsets.all(5)),
          buildSliverFixedExtenList(UserListData.secondItem()),
          SliverPadding(padding: EdgeInsets.all(5)),
          buildSliverFixedExtenList(UserListData.thirdItem()),
        ],
      );
    });
  }

  Widget buildItemWidget(String icon, String title, {String moreinfo}) {
    return Container(
        color: Colors.white,
        child: ListTile(
          dense: true,
          leading: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(icon), fit: BoxFit.fill)),
          ),
          horizontalTitleGap: 10,
          title: Text(
            title,
            style: TextStyleMacor.nor14col333,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ));
  }

  Widget buildSliverFixedExtenList(List items) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate((BuildContext context, num index) {
        UserItem item = items[index];
        return buildItemWidget(item.icon, item.name);
      }, childCount: items.length),
      itemExtent: 44,
    );
  }
}
