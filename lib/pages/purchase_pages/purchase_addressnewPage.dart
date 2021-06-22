import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/puby_page.dart';

class PurchaseaddressnewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseaddressnewPageState();
  }
}

class _PurchaseaddressnewPageState extends State<PurchaseaddressnewPage> {
  bool _switchValue = false;
  List<String> namelist = ['联系人', '手机号', '省/市/县', '详细地址', '设为默认地址'];
  List<String> placelist = ['请输入您的姓名', '请输入您的手机号', '选择省市区', '请输入您的详细地址', ''];
  List<int> typelist = [0, 0, 1, 0, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: configOrangeAppBar('新增收货地址'),
      body: Container(
          child: Column(
        children: [_buildBody(), Gaps.vGap20, Gaps.vGap10, _buildSurebtn()],
      )),
    );
  }

  Widget _buildBody() {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        height: 280,
        child: Card(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildshuru(index, namelist[index], placelist[index],
                      typelist[index]);
                },
                separatorBuilder: (context, index) {
                  return CurrentData().configlineSpace(height: 1);
                },
                itemCount: 5)));
  }

  Widget _buildSurebtn() {
    return Container(
      width: SizeMacro().screenWidth - 80,
      height: 40,
      child: TextButton(
        onPressed: () {},
        child: Text(
          '保存',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
    );
  }

  Widget _buildshuru(int index, String name, String placehold, int type) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyleMacor.nor14col333,
          ),
          type == 0
              ? Container(
                  height: 50,
                  width: 150,
                  child: TextField(
                      textAlign: TextAlign.right,
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
                        hintText: placehold,
                        hintStyle: TextStyleMacor.nor16col999,
                      )))
              : (type == 1
                  ? Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Text(
                                'data',
                                style: TextStyleMacor.nor14col333,
                              ),
                            ),
                          ),
                          Gaps.hGap10,
                          ImageIconMacro.arrowrightIcon
                        ],
                      ),
                    )
                  : Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      }))
        ],
      ),
    );
  }
}
