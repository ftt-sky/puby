import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puby/puby_page.dart';

class PurchaseCaogaoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseCaogaoPageState();
  }
}

class _PurchaseCaogaoPageState extends State<PurchaseCaogaoPage> {
  /// 生命周期
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return _createScaff();
  }

  /// 构建视图
  ///
  ///

  Widget _createScaff() {
    return Scaffold(
      appBar: configOrangeAppBar('采购记录'),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  /// 触发方法
  ///
  ///

}
