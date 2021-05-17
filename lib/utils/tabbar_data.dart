import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:puby/commen/common_index.dart';
import 'package:puby/utils/utils.dart';

class TabbarData {
  static const gradients = [
    null,
    LinearGradient(
      colors: [Colors.white, Colors.white, Colors.white],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.repeated,
    ),
    LinearGradient(
        colors: [Colors.blue, Colors.redAccent, Colors.blue],
        begin: Alignment.center,
        end: Alignment(-1, 1),
        tileMode: TileMode.repeated)
  ];

  static List<TabItem> items({bool image}) {
    if (image) {
      return [
        TabItem(
            icon: Image.asset(
                Utils.getImagePath(ImageStringMacro.xueyuanimageStr)),
            activeIcon: Image.asset(
                Utils.getImagePath(ImageStringMacro.xueyuansimageStr)),
            title: '学院'),
        TabItem(
            icon: Image.asset(
                Utils.getImagePath(ImageStringMacro.huanzhegoutongimageStr)),
            activeIcon: Image.asset(
                Utils.getImagePath(ImageStringMacro.huanzhegoutongsimageStr)),
            title: '患者'),
        TabItem(
            icon: Image.asset(
                Utils.getImagePath(ImageStringMacro.gongzuotaiimageStr)),
            activeIcon: Image.asset(
                Utils.getImagePath(ImageStringMacro.gongzuotaiimageStr)),
            title: '工作台'),
        TabItem(
            icon: Image.asset(
                Utils.getImagePath(ImageStringMacro.caigouimageStr)),
            activeIcon: Image.asset(
                Utils.getImagePath(ImageStringMacro.caigousimageStr)),
            title: '采购'),
        TabItem(
            icon:
                Image.asset(Utils.getImagePath(ImageStringMacro.wodeimageStr)),
            activeIcon:
                Image.asset(Utils.getImagePath(ImageStringMacro.wodesimageStr)),
            title: '我的'),
      ];
    }

    return [
      TabItem<IconData>(icon: Icons.home, title: '学院'),
      TabItem<IconData>(icon: Icons.mail, title: '患者'),
      TabItem<IconData>(icon: Icons.publish, title: '工作台'),
      TabItem<IconData>(icon: Icons.message, title: '采购'),
      TabItem<IconData>(icon: Icons.people, title: '我的'),
    ];
  }
}

class UserListData {
  static List<UserItem> firstItem() {
    return [
      UserItem('平台订单', Utils.getImagePath(ImageStringMacro.pingtaidingdanStr)),
      UserItem('认证中心', Utils.getImagePath(ImageStringMacro.renzhengStr)),
    ];
  }

  static List<UserItem> secondItem() {
    return [
      UserItem('我的收藏', Utils.getImagePath(ImageStringMacro.shoucangStr)),
      UserItem('我的奖品', Utils.getImagePath(ImageStringMacro.jiangpingStr)),
      UserItem('当前版本', Utils.getImagePath(ImageStringMacro.banbenStr)),
      UserItem('奢者', Utils.getImagePath(ImageStringMacro.shezhiStr))
    ];
  }

  static List<UserItem> thirdItem() {
    return [
      UserItem('联系客服', Utils.getImagePath(ImageStringMacro.kefuStr)),
      UserItem('意见反馈', Utils.getImagePath(ImageStringMacro.yijianfankuiStr))
    ];
  }
}

class UserItem<T> {
  const UserItem(this.name, this.icon, {this.moreinfo});
  // 名字
  final String name;
  // 图片
  final T icon;
  // 更多信息
  final String moreinfo;
}
