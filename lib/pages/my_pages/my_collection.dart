import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class MyCollectionPage extends StatefulWidget {
  final String name;
  MyCollectionPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyCollectionPageState();
  }
}

class _MyCollectionPageState extends State<MyCollectionPage> {
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
          widget.name ?? '我的收藏',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
