import 'package:flutter/material.dart';
import 'package:puby/utils/commen_uitils.dart';

// ignore: must_be_immutable
class OrderSecondPage extends StatefulWidget {
  int index;
  OrderSecondPage({this.index});

  @override
  State<StatefulWidget> createState() {
    return _OrderSecondPageState();
  }
}

class _OrderSecondPageState extends State<OrderSecondPage>
    with AutomaticKeepAliveClientMixin {
  final List<String> _tabValues = ['全部', '待付款', '待发货', '待收货', '退款'];

  String index = '全部';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_buildBtn()],
      ),
    );
  }

  // 创建TabBar

  Widget _buildBtn() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _tabValues.map((e) {
          return TextButton(
              onPressed: () {
                index = e;
                setState(() {});
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.all(
                    e == index ? Colors.orange : Colors.white),
              ),
              child: Text(
                e,
                style: TextStyle(
                    color: index == e ? Colors.white : ColorsMacro.col_333),
              ));
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
