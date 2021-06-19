import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class MycustomerPage extends StatefulWidget {
  final String name;
  MycustomerPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MycustomerPageState();
  }
}

class _MycustomerPageState extends State<MycustomerPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScoff();
  }

  Widget _buildScoff() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name ?? "联系客服",
          style: TextStyleMacor.bold16Col333,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: ColorsMacro.getRandomColor(),
    );
  }
}
