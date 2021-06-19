import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/widegts/curretn_widget.dart';

class MyAuthDoctorInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAuthDoctorInfoPageState();
  }
}

class _MyAuthDoctorInfoPageState extends State<MyAuthDoctorInfoPage> {
  String shenfenzheng = '身份证';
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar('医生认证'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
        child: Stack(children: [
      ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildtextfile(index, "证件类型", "请选择证件类型", true, true);
            } else if (index == 1) {
              return _buildtextfile(index, "所在地", "请选择所在地", true, true);
            } else if (index == 2) {
              return _buildtextfile(index, "医疗机构", "请填写您所在的医疗机构", false, false);
            } else if (index == 3) {
              return _buildtextfile(index, "科室", "请选择科室", false, true);
            } else if (index == 4) {
              return _buildtextfile(index, "职称", "请选择您的职称", false, true);
            } else if (index == 5) {
              return _buildtextfile(index, "个人简介", "请填写您个人的医生", false, false);
            } else if (index == 6) {
              return _buildsevenWidget(
                  '请拍摄并上传您的执业/助理医师资格证书\n(若不在身边,请上传手持身份证照片)');
            } else if (index == 7) {
              return _buildsevenWidget('请拍摄并上传您的身份证正面照');
            } else {
              return _buildsevenWidget('请拍摄并上传您的身份证反面照');
            }
          },
          separatorBuilder: (context, index) {
            if (index == 5) {
              return CurrentData().configlineSpace(height: 10);
            } else {
              return CurrentData().configlineSpace(height: 1);
            }
          },
          itemCount: 9),
      _buildSureBtn()
    ]));
  }

  // 创建输入内容
  Widget _buildtextfile(
      int index, String name, String placehold, bool showxing, bool isselect) {
    return Container(
      height: 50,
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              width: 70,
              child: Row(
                children: [
                  showxing
                      ? Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  Text(name, style: TextStyleMacor.nor14col333),
                ],
              ),
            ),
            Gaps.hGap10,
            isselect
                ? GestureDetector(
                    child: Container(
                        width: 150,
                        child: Text(
                          placehold,
                          style: TextStyleMacor.nor14col333,
                        )),
                  )
                : Container(
                    height: 50,
                    width: 200,
                    child: TextField(
                        onEditingComplete: () {
                          SystemChannels.textInput
                              .invokeMethod("TextInput.hide");
                        },
                        onChanged: (value) {},
                        style: TextStyleMacor.nor14col333,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(-2, 0, 0, 0),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: placehold,
                          hintStyle: TextStyleMacor.nor16col999,
                        )))
          ]),
          isselect ? ImageIconMacro.arrowrightIcon : Container()
        ],
      ),
    );
  }

  Widget _buildsevenWidget(String name) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(name,
                textAlign: TextAlign.center, style: TextStyleMacor.nor14col333),
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  //阴影
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(242, 242, 245, 1)),
            height: 200,
            width: SizeMacro().screenWidth - 80,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ImageIconMacro.jiaimage,
          ),
          Gaps.vGap20
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
              _taptijiao();
            },
            child: Text(
              '提交认证',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }

  void _taptijiao() {}
}
