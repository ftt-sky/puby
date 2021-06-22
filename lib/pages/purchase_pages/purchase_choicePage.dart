import 'package:flutter/material.dart';
import 'package:puby/models/model_index.dart';
import 'package:puby/puby_page.dart';

// ignore: must_be_immutable
class PurchaseChoicePage extends StatefulWidget {
  PurchaseItemModel model;
  final Function onReload;
  PurchaseChoicePage({this.model, this.onReload});
  @override
  State<StatefulWidget> createState() {
    return _PurchaseChoicePageState();
  }
}

class _PurchaseChoicePageState extends State<PurchaseChoicePage> {
  @override
  Widget build(BuildContext context) {
    final route = InheritRouteWidget.of(context).router;
    return AnimatedBuilder(
        animation: route.animation,
        builder: (BuildContext context, Widget child) {
          return CustomSingleChildLayout(
            delegate: WrapLayout(
                progress: route.animation.value,
                height: SizeMacro().screenHeight),
            child: GestureDetector(
              child: Material(
                  color: Colors.transparent, child: _buildChildWidget()),
            ),
          );
        });
  }

  Widget _buildChildWidget() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: SizeMacro().screenWidth - 80,
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              child: Center(
                  child: Text(
                '修改数量',
                style: TextStyleMacor.bold16Col333,
              )),
            ),
            NumselectWidget(
              w: 140,
              h: 40,
              type: 1,
              istextfiled: true,
              jishu: widget.model.price ?? 1,
              selectnumstr: widget.model.num ?? 0,
              onChanged: (e) {
                if (e != '请输入' || e != null) {
                  widget.model.num = e;
                }
              },
            ),
            Gaps.vGap20,
            CurrentData().configlineSpace(height: 1),
            Container(
                width: SizeMacro().screenWidth - 80,
                height: 39,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: (SizeMacro().screenWidth - 80) / 2,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('取消', style: TextStyleMacor.nor16col333),
                      ),
                    ),
                    Container(
                        width: (SizeMacro().screenWidth - 80) / 2,
                        height: 39,
                        child: TextButton(
                          onPressed: () {
                            configReload();
                          },
                          child: Text('确定',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10)))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void configReload() {
    Navigator.pop(context);
    if (widget.onReload != null) {
      widget.onReload();
    }
  }
}
