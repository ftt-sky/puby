class UserModel {
  int _code;
  Data _data;
  String _message;

  int get code => _code;
  Data get data => _data;
  String get message => _message;

  UserModel({int code, Data data, String message}) {
    _code = code;
    _data = data;
    _message = message;
  }

  UserModel.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["message"] = _message;
    return map;
  }
}

class Data {
  int _id;
  String _name;
  String _avatar;

  int get id => _id;
  String get name => _name;
  String get avatar => _avatar;

  Data({int id, String name, String avatar}) {
    _id = id;
    _name = name;
    _avatar = avatar;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['avatar'] = _avatar;
    return map;
  }
}
