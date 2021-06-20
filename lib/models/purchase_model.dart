import 'dart:convert';

import 'package:puby/third/azlistview/azlistview.dart';

class PurchaseItemModel extends ISuspensionBean {
  String name;
  String tagIndex;
  String namePinyin;
  bool isheader = false;

  PurchaseItemModel({this.name, this.tagIndex, this.namePinyin, this.isheader});

  PurchaseItemModel.fromJson(Map<String, dynamic> json) : name = json['name'];
  Map<String, dynamic> toJson() => {'name': name};

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}
