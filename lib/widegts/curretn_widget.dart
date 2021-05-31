import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:puby/puby_page.dart';

// 加载动画
Widget buildLoadPage() {
  return Center(
    child: Lottie.asset(ImageStringMacro.loadingStr,
        width: 126, fit: BoxFit.cover, alignment: Alignment.center),
  );
}

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
