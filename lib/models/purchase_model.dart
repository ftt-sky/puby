import 'dart:convert';

import 'package:puby/third/azlistview/azlistview.dart';

class PurchaseItemModel extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;
  String num = '0.0';
  double price = 1.0;
  bool isheader = false;
  bool isselect = true;

  PurchaseItemModel(
      {this.name,
      this.tagIndex,
      this.namePinyin,
      this.isheader,
      this.isselect,
      this.num,
      this.price});

  PurchaseItemModel.fromJson(Map<String, dynamic> json) : name = json['name'];
  Map<String, dynamic> toJson() => {'name': name};

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}
