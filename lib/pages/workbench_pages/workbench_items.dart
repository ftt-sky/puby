import 'package:flutter/material.dart';
import '../../puby_page.dart';
import 'package:puby/models/model_index.dart';

Widget buildtItemWidget(List items) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    height: items.length == 4 ? 90 : 180,
    decoration: BoxDecoration(
        color: Colors.red,
        gradient:
            LinearGradient(colors: [ColorsMacro.col_FFF, ColorsMacro.col_FFF]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0.0, 0.0),
              blurRadius: .0)
        ]),
    child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        WorkbenchItemModel model = items[index];
        return BtnItemWidget(
          title: model.title,
          image: model.image,
          ontap: () {},
        );
      },
    ),
  );
}
