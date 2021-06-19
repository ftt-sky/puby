import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/commen_uitils.dart';

class MySetPage extends StatefulWidget {
  final String name;
  MySetPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MySetPageState();
  }
}

class _MySetPageState extends State<MySetPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(color: ColorsMacro.col_FFF),
        title: Text(
          widget.name ?? '设置',
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
          return _buildItems(UserListData.settList()[index]);
        },
        separatorBuilder: (context, index) {
          if (index == 1 || index == 0) {
            return CurrentData().configlineSpace(height: 10);
          } else {
            return CurrentData().configlineSpace(height: 1);
          }
        },
        itemCount: UserListData.settList().length);
  }

  Widget _buildItems(UserItem item) {
    return Container(
        height: 44,
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          dense: true,
          horizontalTitleGap: 10,
          title: Text(
            item.name,
            style: TextStyleMacor.nor14col333,
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ));
  }
}
