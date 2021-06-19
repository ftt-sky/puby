import 'package:flutter/material.dart';

class MyprizePage extends StatefulWidget {
  final String name;
  MyprizePage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyprizePageState();
  }
}

class _MyprizePageState extends State<MyprizePage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name ?? '我的奖品',
        ),
      ),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
