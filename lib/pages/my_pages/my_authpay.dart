import 'package:flutter/material.dart';
import 'package:puby/widegts/curretn_widget.dart';

class MyAuthPayPage extends StatefulWidget {
  String name;
  MyAuthPayPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyAuthPayPageState();
  }
}

class _MyAuthPayPageState extends State<MyAuthPayPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar(widget.name ?? '支付机构认证'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
