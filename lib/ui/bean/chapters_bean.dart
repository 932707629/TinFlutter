
/// data : [{"children":["String"],"courseId":13,"id":408,"name":"鸿洋","order":190000,"parentChapterId":407,"userControlSetTop":false,"visible":1},null]
/// errorCode : 0
/// errorMsg : ""
class ChaptersBean {
  List<Data>? _data;
  int? _errorCode;
  String? _errorMsg;

  List<Data>? get data => _data;
  int? get errorCode => _errorCode;
  String? get errorMsg => _errorMsg;

  ChaptersBean({
      List<Data>? data, 
      int? errorCode, 
      String? errorMsg}){
    _data = data;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
}

  ChaptersBean.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    return map;
  }

}

/// children : ["String"]
/// courseId : 13
/// id : 408
/// name : "鸿洋"
/// order : 190000
/// parentChapterId : 407
/// userControlSetTop : false
/// visible : 1

class Data {
  List<String>? _children;
  int? _courseId;
  int? _id;
  String? _name;
  int? _order;
  int? _parentChapterId;
  bool? _userControlSetTop;
  int? _visible;

  List<String>? get children => _children;
  int? get courseId => _courseId;
  int? get id => _id;
  String? get name => _name;
  int? get order => _order;
  int? get parentChapterId => _parentChapterId;
  bool? get userControlSetTop => _userControlSetTop;
  int? get visible => _visible;

  Data({
      List<String>? children, 
      int? courseId, 
      int? id, 
      String? name, 
      int? order, 
      int? parentChapterId, 
      bool? userControlSetTop, 
      int? visible}){
    _children = children;
    _courseId = courseId;
    _id = id;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
}

  Data.fromJson(dynamic json) {
    _children = json['children'] != null ? json['children'].cast<String>() : [];
    _courseId = json['courseId'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['children'] = _children;
    map['courseId'] = _courseId;
    map['id'] = _id;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }

}