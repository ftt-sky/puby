import 'dart:ffi';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:puby/commen/common_index.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/utils.dart';

import 'commen_uitils.dart';
import 'package:puby/models/model_index.dart';

class CurrentData {
  static String imageurl =
      'https://img2.woyaogexing.com/2020/03/10/e5cfaf077edb4d4e83465e27aae25795!1080x1920.jpeg';
  static List<String> currentImage = [imageurl, imageurl, imageurl];

  Widget configlineSpace({double height = 1}) {
    return Container(height: height, color: ColorsMacro.col_F7F);
  }
}

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

class ImageIconMacro {
  // 消息
  static Image messageIcon = Image.asset(
    Utils.getImagePath(ImageStringMacro.xiaoxiStr),
    width: 24,
    height: 24,
  );

  // 向右箭头
  static Icon arrowrightIcon = Icon(
    Icons.keyboard_arrow_right,
    color: ColorsMacro.col_333,
  );

  // 搜索
  static Image search = Image.asset(
    Utils.getImagePath(ImageStringMacro.sousuoStr),
    width: 18,
    height: 18,
  );

  // 开方
  static Image kaifang =
      configbigImage(Utils.getImagePath(ImageStringMacro.kaifangStr));
  // 售药
  static Image shouyao =
      configbigImage(Utils.getImagePath(ImageStringMacro.shouyaoStr));
  // 历史处方
  static Image lisichufang =
      configbigImage(Utils.getImagePath(ImageStringMacro.lisichufangStr));
  // 协定处方
  static Image xieidngchufang =
      configbigImage(Utils.getImagePath(ImageStringMacro.xiedingchufangStr));

  // 采购item
  static Image caigouitemImage =
      configminImage(Utils.getImagePath(ImageStringMacro.caigouitemStr));
  // 供应商
  static Image gongyingshangImage =
      configminImage(Utils.getImagePath(ImageStringMacro.gongyingshangStr));
  // 理疗
  static Image liliaoImage =
      configminImage(Utils.getImagePath(ImageStringMacro.liliaoStr));
  // 盘存
  static Image pancunImage =
      configminImage(Utils.getImagePath(ImageStringMacro.pancunStr));
  // 入库
  static Image rukuImage =
      configminImage(Utils.getImagePath(ImageStringMacro.rukuStr));
  // 收益
  static Image shouyiImage =
      configminImage(Utils.getImagePath(ImageStringMacro.shouyinStr));
  // 药房
  static Image yaofangImage =
      configminImage(Utils.getImagePath(ImageStringMacro.yaofangStr));

  // 获取40 * 40 图
  static Image configbigImage(String path) {
    return Image.asset(
      path,
      width: 40,
      height: 40,
    );
  }

  // 获取30 * 30 图
  static Image configminImage(String path) {
    return Image.asset(
      path,
      width: 30,
      height: 30,
    );
  }
}

class WorkbenchItem {
  static List<WorkbenchItemModel> firstImages() {
    return [
      WorkbenchItemModel(image: ImageIconMacro.kaifang, title: '开方', id: '0'),
      WorkbenchItemModel(image: ImageIconMacro.shouyao, title: '售药', id: '1'),
      WorkbenchItemModel(
          image: ImageIconMacro.lisichufang, title: '历史处方', id: '2'),
      WorkbenchItemModel(
          image: ImageIconMacro.xieidngchufang, title: '协定处方', id: '3'),
    ];
  }

  static List<WorkbenchItemModel> secondImages() {
    return [
      WorkbenchItemModel(
          image: ImageIconMacro.shouyiImage, title: '收银', id: '4'),
      WorkbenchItemModel(
          image: ImageIconMacro.yaofangImage, title: '药房', id: '5'),
      WorkbenchItemModel(
          image: ImageIconMacro.caigouitemImage, title: '采购', id: '6'),
      WorkbenchItemModel(image: ImageIconMacro.rukuImage, title: '入库', id: '7'),
      WorkbenchItemModel(
          image: ImageIconMacro.pancunImage, title: '盘存', id: '8'),
      WorkbenchItemModel(
          image: ImageIconMacro.gongyingshangImage, title: '供应商管理', id: '9'),
      WorkbenchItemModel(
          image: ImageIconMacro.liliaoImage, title: '理疗', id: '10'),
    ];
  }
}
