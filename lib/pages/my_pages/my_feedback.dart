import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/puby_page.dart';

class MyFeedBackPage extends StatefulWidget {
  final String name;
  MyFeedBackPage({this.name});

  @override
  State<StatefulWidget> createState() {
    return _MyFeedBackPageState();
  }
}

class _MyFeedBackPageState extends State<MyFeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name ?? "意见反馈",
          style: TextStyleMacor.bold16Col333,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: SizeMacro().screenHeight,
      child: Stack(
        children: [buildextField(), buildSureBtn()],
      ),
    );
  }

  // 创建输入框
  Widget buildextField() {
    return TextField(
        onEditingComplete: () {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
        },
        maxLines: null,
        style: TextStyleMacor.nor14col333,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          filled: true,
          border: InputBorder.none,
          hintText: '说说你的意见',
        ));
  }

  Widget buildSureBtn() {
    return Positioned(
        bottom: 40,
        child: Container(
          width: SizeMacro().screenWidth,
          height: 70,
          padding: EdgeInsets.fromLTRB(35, 30, 35, 0),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.orange, width: 1))),
            onPressed: () {
              _tapsure();
            },
            child: Text(
              '提交',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }

  _tapsure() {}
}
