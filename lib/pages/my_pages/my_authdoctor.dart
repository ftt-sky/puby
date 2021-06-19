import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:puby/puby_page.dart';

// ignore: must_be_immutable
class MyAuthDoctorPage extends StatefulWidget {
  String name;
  MyAuthDoctorPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyAuthDoctorPageState();
  }
}

class _MyAuthDoctorPageState extends State<MyAuthDoctorPage> {
  bool selectnansex = false;
  bool selectnvsex = false;
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  /// 界面创建
  ///
  ///

  Widget _buildScaff() {
    return Scaffold(
        appBar: configOrangeAppBar(widget.name ?? '医生认证'),
        body: Container(
            height: SizeMacro().screenHeight,
            child: Stack(
              children: [_buildBody(), _buildSureBtn()],
            )));
  }

  Widget _buildBody() {
    return Container(
      height: SizeMacro().screenHeight,
      width: SizeMacro().screenWidth,
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildFirstCellWidget();
            } else if (index == 1) {
              return _buildsecondCellWidget();
            } else {
              return _buildthirdCellWidget();
            }
          },
          separatorBuilder: (context, index) {
            return CurrentData().configlineSpace(height: 10);
          },
          itemCount: 3),
    );
  }

  // 显示头像
  Widget _buildFirstCellWidget() {
    return Container(
      height: 140,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap10,
              Text(
                '头像',
                style: TextStyleMacor.nor14col333,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Gaps.hGap20,
          Gaps.hGap20,
          Container(
              width: 80,
              height: 100,
              child: CacheImage(
                url: CurrentData.imageurl,
                borderRadius: BorderRadius.circular(0),
              )),
        ],
      ),
    );
  }

  Widget _buildSureBtn() {
    return Positioned(
        bottom: 0,
        child: Container(
          width: SizeMacro().screenWidth,
          height: 50,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.orange, width: 1))),
            onPressed: () {
              _tapxiayibu();
            },
            child: Text(
              '下一步',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }

  Widget _buildsecondCellWidget() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            '姓名',
            style: TextStyleMacor.nor14col333,
          ),
          Gaps.hGap20,
          Gaps.hGap20,
          Container(
              height: 50,
              width: 200,
              child: TextField(
                  onEditingComplete: () {
                    SystemChannels.textInput.invokeMethod("TextInput.hide");
                  },
                  onChanged: (value) {},
                  style: TextStyleMacor.nor14col333,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(-2, 0, 0, 0),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: '姓名',
                    hintStyle: TextStyleMacor.nor16col999,
                  ))),
        ],
      ),
    );
  }

  Widget _buildthirdCellWidget() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            '性别',
            style: TextStyleMacor.nor14col333,
          ),
          Gaps.hGap20,
          Gaps.hGap20,
          _buildsexWidget('男'),
          Gaps.hGap20,
          _buildsexWidget('女')
        ],
      ),
    );
  }

  Widget _buildsexWidget(String sex) {
    return GestureDetector(
        onTap: () {
          if (sex == '男') {
            selectnansex = true;
            selectnvsex = false;
          } else {
            selectnansex = false;
            selectnvsex = true;
          }
          setState(() {});
        },
        child: Row(
          children: [
            sex == '男'
                ? _buildSelectimage(selectnansex)
                : _buildSelectimage(selectnvsex),
            Gaps.hGap5,
            Text(
              sex,
              style: TextStyleMacor.nor14col333,
            )
          ],
        ));
  }

  Widget _buildSelectimage(bool iselect) {
    return (iselect
        ? ImageIconMacro.xuanzhongimage
        : ImageIconMacro.weixuanzhongimage);
  }

  /// 触发方法
  ///
  ///

  // 点击下一步
  void _tapxiayibu() {
    RouteManager.pushPage(context, PageIdMacro.myauthdoctorinfo);
  }
}
