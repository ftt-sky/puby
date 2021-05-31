import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:puby/puby_page.dart';

class CommonBasePage extends StatelessWidget {
  final PageState pageState;
  final BaseError baseError;
  final VoidCallback buttonActionCallback;
  final Widget child;

  const CommonBasePage(
      {Key key,
      this.pageState,
      this.baseError,
      this.buttonActionCallback,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pageState == PageState.busyState ||
        pageState == PageState.initializedState) {
      return Center(
        child: Lottie.asset('assets/json/loading2.json',
            width: 126, fit: BoxFit.cover, alignment: Alignment.center),
      );
    }

    if (pageState == PageState.emptyDataState) {
      return ErrorPage(
        isEmptyPage: true,
        icon: Lottie.asset('assets/json/empty3.json',
            width: SizeMacro().screenWidth / 1.8,
            height: 220,
            fit: BoxFit.contain,
            alignment: Alignment.center),
        desc: '暂 无 数 据',
        buttonAction: buttonActionCallback,
      );
    }

    if (pageState == PageState.errorState) {
      return ErrorPage(
          title: baseError is NeedLogin
              ? '😮 你竟然忘记登录 😮'
              : baseError.code.toString(),
          desc: baseError.message,
          buttonAction: () async {
            if (baseError is NeedLogin) {}
          },
          buttonText: baseError is NeedLogin ? '登录' : '');
    }

    return child;
  }
}
