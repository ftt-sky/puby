import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:lottie/lottie.dart';
import 'package:puby/puby_page.dart';

/// 动画
///
///
///

// 加载动画
Widget buildLoadPage() {
  return Center(
    child: Lottie.asset(ImageStringMacro.loadingStr,
        width: 126, fit: BoxFit.cover, alignment: Alignment.center),
  );
}

/// 直线进度条
// ignore: must_be_immutable
class TTProgressBar extends StatefulWidget {
// ignore: must_be_immutable
  double progress;
  TTProgressBar({this.progress, Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TTProgressBarState();
  }
}

class TTProgressBarState extends State<TTProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: proGressBar(widget.progress, context));
  }

  Widget proGressBar(double progress, BuildContext context) {
    if (progress == 1.0) {
      return Container(height: 0);
    } else {
      return Container(
        child: LinearProgressIndicator(
            backgroundColor: ColorsMacro.col_CDA,
            value: progress == 1.0 ? 0 : progress,
            valueColor: ColorTween(begin: Colors.orange, end: Colors.red)
                .animate(_animationController)),
        height: 2,
      );
    }
  }
}

// toast 弹框
void showmessage(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.66),
      textColor: Colors.white,
      fontSize: 14);
}

/// banner
///
///
///
// 自定义 banner
class TTBannerWidget extends StatefulWidget {
  final double bannerW;
  final double bannerH;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;
  final List<String> list;
  final BorderRadius radius;
  final double scale;
  final double viewportFraction;
  final bool autoplay;

  TTBannerWidget(
      {Key key,
      @required this.radius,
      this.list,
      this.bannerH,
      this.bannerW,
      this.padding,
      this.viewportFraction = 1,
      this.autoplay = true,
      this.scale = 1,
      this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TTBannerWidgetState();
  }
}

class TTBannerWidgetState extends State<TTBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return bannerWidget(context, widget.list);
  }

  Widget bannerWidget(BuildContext context, List<String> list) {
    final double w = widget.bannerW;
    final double h = widget.bannerH;
    if (ObjectUtil.isEmpty(list)) {
      return Container(height: 0.0);
    }
    return Container(
      padding: widget.padding,
      width: w,
      height: h,
      child: Swiper(
        itemCount: list.length,
        autoplay: true,
        viewportFraction: 1,
        scale: widget.scale,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white.withOpacity(0.5),
              activeColor: Colors.white,
            ),
            margin: EdgeInsets.all(SizeMacro().setWidth(10))),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: CacheImage(url: list[index], borderRadius: widget.radius),
          );
        },
      ),
    );
  }
}

/// 按钮
///
///
///
// 图上文字下 按钮
class BtnItemWidget extends StatelessWidget {
  final GestureTapCallback ontap;
  final String title;
  final image;

  BtnItemWidget({this.title, this.image, this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          Gaps.vGap5,
          Text(title, style: TextStyleMacor.nor14col333)
        ],
      ),
    );
  }
}

/// TextFiled
///
///
///
// 创建输入框
// ignore: must_be_immutable
class TextFiledWidget extends StatefulWidget {
  Function(String value) onChanged;

  Function() onTap;

  VoidCallback onEditingComplete;

  /// 是否隐藏文本
  bool obscureText;

  /// 提示文本
  String labelText;

  /// 字体
  TextStyle textStyle = TextStyleMacor.nor14col333;

  // 输入中的边线
  InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  );
  // 输入前的边线
  InputBorder enabledBorder = UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(10)));

  ///
  Widget prefixIcon;
  Widget suffixIconData;
  TextFiledWidget(
      {this.onChanged,
      this.onTap,
      this.obscureText,
      this.labelText = '请输入内容',
      this.textStyle,
      this.prefixIcon,
      this.suffixIconData,
      this.focusedBorder,
      this.enabledBorder,
      this.onEditingComplete});

  @override
  State<StatefulWidget> createState() {
    return TextFiledWidgetState();
  }
}

class TextFiledWidgetState extends State<TextFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // 实时输入回调
      onChanged: widget.onChanged,
      // 点击确定按钮回调
      onEditingComplete: () {
        SystemChannels.textInput.invokeMethod("TextInput.hide");
      },

      /// 点击输入框回调
      onTap: widget.onTap,

      /// 是否隐藏文本 用于密码
      obscureText: widget.obscureText,

      style: widget.textStyle,
      // 输入框可用时的边框变化
      decoration: InputDecoration(
          border: InputBorder.none,
          // 填充一下
          filled: true,
          hintText: widget.labelText,
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16.0),
          // // 提示文本
          // labelText: widget.labelText,
          // 去掉默认的下划线
          // 输入前的边线
          enabledBorder: widget.enabledBorder,
          // 输入中的边线
          focusedBorder: widget.focusedBorder,
          // 输入框前的图标
          prefixIcon: widget.prefixIcon,
          // 输入文本后的图标
          suffixIcon: IconButton(
              icon: widget.suffixIconData ?? Container(),
              onPressed: () {
                widget.obscureText = !widget.obscureText;
                setState(() {});
              })),
    );
  }
}

// 拨打电话
void configtellphone(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '提示',
            style: TextStyleMacor.bold16Col333,
          ),
          content: Text(
            '是否致电客服热线:' + CurrentData.kefuphone + '?',
            style: TextStyleMacor.nor14col333,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.orange),
                )),
            TextButton(
                onPressed: () {
                  configcallphonepermission(context).then((value) {
                    if (value) {
                      //TelAndSmsService().call(CurrentData.kefuphone);
                    }
                  }).catchError((_) {});
                },
                child: Text(
                  '确认',
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        );
      });
}

Future<bool> configcallphonepermission(BuildContext context) async {
  return true;
  // Permission _permission = Permission.photos;
  // final status = await _permission.status;
  // switch (status) {
  //   case PermissionStatus.denied:
  //     checkServiceStatus(context, _permission);
  //     return false;
  //     break;
  //   case PermissionStatus.granted:
  //     return true;
  //   case PermissionStatus.limited:
  //     return false;
  //   default:
  //     return false;
  // }
}

// void checkServiceStatus(BuildContext context, Permission permission) async {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text((await permission.status).toString()),
//   ));
// }

// ignore: must_be_immutable
class CurrentSearchPage extends StatelessWidget {
  final String hintText;
  Function(String value) onSearch;
  String searchtext;
  CurrentSearchPage({this.hintText, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return buildlistSearch();
  }

  // 创建搜索
  Widget buildlistSearch() {
    return Container(
      color: Colors.white,
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.hGap10,
          Container(
              width: SizeMacro().screenWidth - 80,
              height: 36,
              child: buildSearchTextField()),
          buildSearchSureBtn()
        ],
      ),
    );
  }

  // 创建输入框
  Widget buildSearchTextField() {
    return TextField(
        onEditingComplete: () {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
        },
        onChanged: (value) {
          searchtext = value;
        },
        style: TextStyleMacor.nor14col333,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          fillColor: ColorsMacro.col_F7F,
          filled: true,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,
            color: ColorsMacro.col_666,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMacro.col_EEE, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          hintText: hintText,
          // name == '我的收藏' ? '请输入搜索内容/关键字' : '请输入名称/联系人/手机号',
          hintStyle: TextStyleMacor.nor14col666,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMacro.col_EEE, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ));
  }

  Widget buildSearchSureBtn() {
    return Container(
        width: 70,
        child: TextButton(
            onPressed: () {
              onSearch(searchtext);
            },
            child: Text('搜索', style: TextStyleMacor.nor14col333)));
  }
}

// 配置橘黄色导航栏
Widget configOrangeAppBar(String name) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.orange,
    leading: BackButton(color: ColorsMacro.col_FFF),
    title: Text(
      name,
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

// ignore: must_be_immutable
class NumselectWidget extends StatefulWidget {
  double w;
  double h;
  int type;
  double jishu;
  String selectnumstr;
  bool istextfiled;
  Function(String value) onChanged;
  Function(String value) onTapnum;
  NumselectWidget(
      {this.w,
      this.h,
      this.type = 0,
      this.selectnumstr = '0',
      this.jishu = 1.0,
      this.istextfiled = false,
      this.onChanged});
  @override
  State<StatefulWidget> createState() {
    return _NumselectWidgetState();
  }
}

class _NumselectWidgetState extends State<NumselectWidget> {
  double selectnum;

  String tf = '0';
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = widget.selectnumstr;
    selectnum = double.parse(widget.selectnumstr) / widget.jishu;
    return Container(
      width: widget.w,
      height: widget.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            child: TextButton(
                onPressed: () {
                  reloadnum(0);
                },
                child: ImageIconMacro.jianimage),
          ),
          widget.istextfiled
              ? Container(
                  width: widget.w - 80,
                  child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.center,
                      onEditingComplete: () {
                        SystemChannels.textInput.invokeMethod("TextInput.hide");
                      },
                      onChanged: (value) {
                        tf = value;
                        selectnum = 0;
                        widget.selectnumstr = value;
                        setState(() {});
                      },
                      controller: _textEditingController,
                      style: TextStyleMacor.nor14col333,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(-2, 0, 0, 0),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: widget.selectnumstr,
                        hintStyle: TextStyleMacor.nor14col333,
                      )))
              : GestureDetector(
                  onTap: () {
                    if (widget.onTapnum != null) {
                      widget.onTapnum(widget.selectnumstr);
                    }
                  },
                  child: Text(
                    widget.selectnumstr,
                    style: TextStyleMacor.nor14col333,
                  ),
                ),
          Container(
            width: 40,
            child: TextButton(
                onPressed: () {
                  reloadnum(1);
                },
                child: widget.type == 0
                    ? ImageIconMacro.zengjianlvseimage
                    : ImageIconMacro.zengjianhuangseimage),
          )
        ],
      ),
    );
  }

  void reloadnum(int type) {
    if (type == 0) {
      if (selectnum > 0) {
        selectnum--;
      }
    } else {
      selectnum++;
    }
    double num = selectnum * widget.jishu;
    if (widget.istextfiled) {
      double tfnum = double.parse(tf) + num;
      widget.selectnumstr = '$tfnum';
    } else {
      widget.selectnumstr = '$num';
    }
    if (widget.onChanged != null) {
      widget.onChanged(widget.selectnumstr);
    }
    setState(() {});
  }
}

class WrapLayout extends SingleChildLayoutDelegate {
  WrapLayout({
    @required this.progress,
    @required this.height,
  });

  final double progress;
  final double height;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = height;

    return new BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - childSize.height * progress;
    return new Offset(0.0, height);
  }

  @override
  bool shouldRelayout(WrapLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

// 创建地址按钮
Widget configbuildbottomBtn({String name, VoidCallback onPressed}) {
  return Positioned(
      bottom: ScreenUtil().bottomBarHeight,
      child: Container(
        width: SizeMacro().screenWidth,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.orange, width: 1))),
          onPressed: () {
            if (onPressed != null) {
              onPressed();
            }
          },
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ));
}
