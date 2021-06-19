import 'package:flutter/material.dart';
import 'package:puby/puby_page.dart';

class PatientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PatientPageState();
  }
}

class PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return _buildScaffWidget();
  }

  /// 界面创建
  ///
  ///

  Widget _buildScaffWidget() {
    return Scaffold(
      appBar: AppBar(title: Text('患者', style: TextStyleMacor.bold16Col333)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: ColorsMacro.getRandomColor(),
    );
  }
}
