import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:puby/commen/common_index.dart';
import 'package:puby/puby_page.dart';
import 'package:puby/utils/utils.dart';

import 'commen_uitils.dart';
import 'package:puby/models/model_index.dart';

class CurrentData {
  // 客服电话
  static String kefuphone = "13811111111";
  // 通用测试图片
  static String imageurl =
      'https://img2.woyaogexing.com/2020/03/10/e5cfaf077edb4d4e83465e27aae25795!1080x1920.jpeg';
  static List<String> currentImage = [imageurl, imageurl, imageurl];
  // 通用测试视频地址
  static String playerurl =
      'http://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4';
  // 主题黄色
  static Color thereColors = Color(0xFFFC8607);
  // 绿色
  static Color lvColors = Color(0xFF39c49a);

  // 通用间隔
  Widget configlineSpace(
      {double height = 1, Color color = ColorsMacro.col_F7F}) {
    return Container(height: height, color: color);
  }

  // 药材类型
  static List yaocaileixinglist = ['中药颗粒袋装', '中药颗粒瓶装', '中西成药', '中药饮片'];

  static List gongyingshanglist = ['文宗堂团队', '文宗堂团队2', '文宗堂团队3', '文宗堂团队4'];

  static List changshangshuaixuanlist = [
    '哈尔冰珍宝岛',
    '哈尔冰珍宝岛2',
    '哈尔冰珍宝岛3',
    '哈尔冰珍宝岛4'
  ];
}

class TabbarData {
  static List<String> widgeIdList = [
    PageIdMacro.collegeId,
    PageIdMacro.patientId,
    PageIdMacro.workbenchId,
    PageIdMacro.purchaseId,
    PageIdMacro.myId
  ];
  static List<Widget> widgetList() {
    List<Widget> list = [];
    for (var ids in widgeIdList) {
      list.add(RouteManager.configCurrentWidget(ids));
    }
    return list;
  }

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
      UserItem('平台订单',
          icon: Utils.getImagePath(ImageStringMacro.pingtaidingdanStr),
          pageName: PageIdMacro.myodercenter),
      UserItem('认证中心',
          icon: Utils.getImagePath(ImageStringMacro.renzhengStr),
          pageName: PageIdMacro.myauthentication),
    ];
  }

  static List<UserItem> secondItem() {
    return [
      UserItem('我的收藏',
          icon: Utils.getImagePath(ImageStringMacro.shoucangStr),
          pageName: PageIdMacro.mycollection),
      //serItem('我的奖品', Utils.getImagePath(ImageStringMacro.jiangpingStr),
      //  pageName: PageIdMacro.myprize),
      UserItem('当前版本',
          icon: Utils.getImagePath(ImageStringMacro.banbenStr),
          moreinfo: "1.0.0",
          pageName: PageIdMacro.myversion),
      UserItem('设置',
          icon: Utils.getImagePath(ImageStringMacro.shezhiStr),
          pageName: PageIdMacro.mysett)
    ];
  }

  static List<UserItem> thirdItem() {
    return [
      UserItem('联系客服',
          icon: Utils.getImagePath(ImageStringMacro.kefuStr),
          pageName: PageIdMacro.mycostomer),
      UserItem('意见反馈',
          icon: Utils.getImagePath(ImageStringMacro.yijianfankuiStr),
          pageName: PageIdMacro.myfeedback)
    ];
  }

  // 认证
  static List<UserItem> authenList() {
    return [
      UserItem('机构认证', pageName: PageIdMacro.myauthmech),
      UserItem('医生认证', pageName: PageIdMacro.myauthdoctor),
      UserItem('支付商户认证', pageName: PageIdMacro.myauthpay)
    ];
  }

  // 设置
  static List<UserItem> settList() {
    return [
      UserItem(
        '修改密码',
        pageName: PageIdMacro.mychangepassword,
      ),
      UserItem(
        '版本更新',
      ),
      UserItem(
        '切换账号',
        pageName: PageIdMacro.mychangephone,
      ),
      UserItem('退出'),
      UserItem('注销')
    ];
  }
}

class UserItem<T> {
  const UserItem(this.name, {this.icon, this.pageName = "", this.moreinfo});
  // 名字
  final String name;
  // 界面标识
  final String pageName;
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

  static Image shipin = Image.asset(
    Utils.getImagePath(ImageStringMacro.shipinStr),
    width: 24,
    height: 24,
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
  // 定位
  static Image dingweiimage =
      configminImage(Utils.getImagePath(ImageStringMacro.authdingweiStr));
  // 医院
  static Image yiyuanimage =
      configminImage(Utils.getImagePath(ImageStringMacro.authyiyuanStr));
  // 诊疗
  static Image zhenliaoimage =
      configminImage(Utils.getImagePath(ImageStringMacro.authzhenliaoStr));
  // 选中
  static Image xuanzhongimage =
      configminImage(Utils.getImagePath(ImageStringMacro.xuanzhongStr));
  // 未选中
  static Image weixuanzhongimage =
      configminImage(Utils.getImagePath(ImageStringMacro.weixuanzhongStr));
  // 增加 黄色
  static Image zengjianhuangseimage =
      configminImage(Utils.getImagePath(ImageStringMacro.zengjiayStr));
  // 增加 绿色
  static Image zengjianlvseimage =
      configminImage(Utils.getImagePath(ImageStringMacro.zengjiaStr));
  // ➖
  static Image jianimage =
      configminImage(Utils.getImagePath(ImageStringMacro.jianStr));
  // 删除
  static Image delecteimage =
      configminImage(Utils.getImagePath(ImageStringMacro.shanchuStr));
  // 医药箱
  static Image yiyaoxiangimage =
      configbigImage(Utils.getImagePath(ImageStringMacro.yiyaoxiangStr));
  // 供应商
  static Image gongyingshangitemImage =
      configminImage(Utils.getImagePath(ImageStringMacro.gyingshangStr));
  // 厂商
  static Image cangshangImage =
      configminImage(Utils.getImagePath(ImageStringMacro.cangshangStr));
  // 药材类型
  static Image yaocaileixingImage =
      configminImage(Utils.getImagePath(ImageStringMacro.yaocaileixingStr));
  // 药品选中
  static Image yaopinxuanzhongImage = Image.asset(
      Utils.getImagePath(ImageStringMacro.yaopinxuanzhongStr),
      width: 20,
      height: 20);
  // 购物车
  static Image gouwucheImage =
      configminImage(Utils.getImagePath(ImageStringMacro.gouwucheStr));
  // 药品未选中
  static Image yaopinweixuanzhongImage = Image.asset(
    Utils.getImagePath(ImageStringMacro.yaopinweixuanzhongStr),
    width: 20,
    height: 20,
  );

  // 编写
  static Image bianxieimage = Image.asset(
    Utils.getImagePath(ImageStringMacro.bianxieStr),
    width: 14,
    height: 14,
  );
  // 空心圆
  static Image yuanimage = Image.asset(
    Utils.getImagePath(ImageStringMacro.yuanStr),
    width: 14,
    height: 14,
  );
  // 灰色空心圆
  static Image huiseyuanimage = Image.asset(
    Utils.getImagePath(ImageStringMacro.weixuanzhongStr),
    width: 14,
    height: 14,
  );

  // 提交成功
  static Image tijiaochenggongimage = Image.asset(
      Utils.getImagePath(ImageStringMacro.tijiaochenggongStr),
      width: 100,
      height: 100);
  // 上传图片
  static Image jiaimage = Image.asset(
      Utils.getImagePath(ImageStringMacro.jiaStr),
      width: 100,
      height: 100);

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
