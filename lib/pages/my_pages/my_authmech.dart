import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/commen_uitils.dart';

// ignore: must_be_immutable
class MyAuthmechPage extends StatefulWidget {
  String name;
  MyAuthmechPage({this.name});
  @override
  State<StatefulWidget> createState() {
    return _MyAuthmechPageState();
  }
}

class _MyAuthmechPageState extends State<MyAuthmechPage> {
  /// 属性

  // 诊疗
  String zhenliao = '请选择诊疗科目';
  // 医院
  String yiyuan = '请输入医院信息';
  // 定位
  String dingwei = '请选择地址信息';
  // 备注
  String beizhu = '请输入备注信息';
  // 提交成功
  bool tijiaosucess = true;
  // 营业执照
  Image zhizhaoimage;
  // 下标
  SwiperController controller;

  @override
  void initState() {
    controller = new SwiperController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaff();
  }

  Widget _buildScaff() {
    return Scaffold(
      appBar: configOrangeAppBar(widget.name ?? '机构认证'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
        child: Container(
      width: SizeMacro().screenWidth - 50,
      height: 350,
      decoration: BoxDecoration(
          boxShadow: [
            //阴影
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0),
                blurRadius: 4.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: tijiaosucess ? _buildtijiaosuccesee() : _buildBodyColum(),
    ));
  }

  Widget _buildBodyColum() {
    return Column(
      children: [_buildBodyText(), _buildSwiper()],
    );
  }

  Widget _buildBodyText() {
    return Container(
      width: SizeMacro().screenWidth - 50,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.orange,
            height: 1,
            width: 50,
          ),
          Text('1分钟快速完善',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          Container(
            color: Colors.orange,
            height: 1,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget _buildSwiper() {
    return Expanded(
        child: Swiper(
      itemCount: 4,
      controller: controller,
      autoplay: false,
      loop: false,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: ColorsMacro.col_EEE, activeColor: Colors.orange),
          margin: EdgeInsets.only(bottom: 10)),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildFirstWidget();
        } else {
          return _buildSecondWidget(index);
        }
      },
    ));
  }

  ///  创建第一步
  ///
  ///
  ///
  Widget _buildFirstWidget() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0 || index == 2) {
              return _buildFirstselectzlmk(index);
            } else if (index == 1 || index == 3) {
              return _buildFirstselectyiyuanshuru(index);
            } else {
              return _buildSurebtb(0);
            }
          },
          separatorBuilder: (context, index) {
            return CurrentData().configlineSpace(height: 1);
          },
          itemCount: 5),
    );
  }

  Widget _buildFirstselectzlmk(int index) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 24,
        height: 24,
        child: index == 0
            ? ImageIconMacro.zhenliaoimage
            : ImageIconMacro.dingweiimage,
      ),
      title: Text(
        index == 0 ? zhenliao : dingwei,
        style: TextStyle(
            color: index == 0
                ? (zhenliao == '请选择诊疗科目'
                    ? ColorsMacro.col_999
                    : ColorsMacro.col_333)
                : (dingwei == '请选择地址信息'
                    ? ColorsMacro.col_999
                    : ColorsMacro.col_333),
            fontSize: 16),
      ),
    );
  }

  // 创建第一步
  Widget _buildFirstselectyiyuanshuru(int index) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        child: index == 1 ? ImageIconMacro.yiyuanimage : null,
      ),
      title: TextField(
          onEditingComplete: () {
            SystemChannels.textInput.invokeMethod("TextInput.hide");
          },
          onChanged: (value) {
            if (index == 1) {
              yiyuan = value;
            } else {
              beizhu = value;
            }
          },
          style: TextStyleMacor.nor14col333,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(-2, 0, 0, 0),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: index == 1 ? '请输入医院信息' : '请输入备注信息',
            hintStyle: TextStyleMacor.nor16col999,
          )),
    );
  }

  /// 创建第二步
  ///
  ///
  ///

  Widget _buildSecondWidget(int index) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            child: index == 3
                ? RichText(
                    text: TextSpan(children: [
                    TextSpan(
                        text: '请上传门店门口照片(', style: TextStyleMacor.nor16col333),
                    TextSpan(
                        text: '选填',
                        style: TextStyle(color: Colors.red, fontSize: 16)),
                    TextSpan(text: ')', style: TextStyleMacor.nor16col333)
                  ]))
                : Text(
                    index == 1 ? '请上传医疗机构执业许可证' : '请上传身份正面照',
                    style: TextStyleMacor.bold16Col333,
                  ),
          ),
          GestureDetector(
              onTap: () {
                _tapselectimage(index);
              },
              child: Container(
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
                height: 150,
                width: SizeMacro().screenWidth - 100,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: (zhizhaoimage != null)
                    ? zhizhaoimage
                    : ImageIconMacro.jiaimage,
              )),
          Gaps.vGap20,
          _buildSurebtb(index)
        ],
      ),
    );
  }

  /// 创建第三步
  ///
  ///
  ///

  // 创建提交按钮
  Widget _buildSurebtb(int type) {
    return Positioned(
        bottom: 40,
        child: Container(
          width: SizeMacro().screenWidth,
          height: 40,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                side: MaterialStateProperty.all(
                    BorderSide(color: Colors.orange, width: 1))),
            onPressed: () {
              _tapsure(type);
            },
            child: Text(
              type == 6 ? "返回首页" : (type == 3 ? '提交' : '下一步'),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }

  // 创建提交成功
  Widget _buildtijiaosuccesee() {
    return Column(
      children: [
        Gaps.vGap20,
        Gaps.vGap20,
        ImageIconMacro.tijiaochenggongimage,
        Gaps.vGap20,
        Text(
          '资料已提交,请等待审核',
          style: TextStyle(color: Colors.orange, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        Gaps.vGap20,
        Container(
            padding: EdgeInsets.all(20),
            child: Text(
              '专属顾问将在2个工作日内电话联系您,请留意接听电话',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: ColorsMacro.col_333),
            )),
        _buildSurebtb(6)
      ],
    );
  }

  /// 触发方法
  ///
  ///
  ///
  void _tapsure(int type) {
    if (type == 6) {
      Navigator.pop(context);
    } else if (type != 3) {
      controller.next();
    }
  }

  void _tapselectimage(int type) {}
}
