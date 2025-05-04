class ItemModelParent {
  ItemModelParent({
    num? status,
    ItemData? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  ItemModelParent.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? ItemData.fromJson(json['data']) : null;
    _message = json['message'];
  }

  num? _status;
  ItemData? _data;
  String? _message;

  num? get status => _status;
  ItemData? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

class ItemData {
  ItemData({
    List<Item>? items,
  }) {
    _items = items;
  }

  ItemData.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Item.fromJson(v));
      });
    }
  }

  List<Item>? _items;

  List<Item>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Item {
  Item({
    num? id,
    String? title,
    dynamic parentId,
    String? createdAt,
    String? updatedAt,
    List<Item>? childrenRecursive,
  }) {
    _id = id;
    _title = title;
    _parentId = parentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _childrenRecursive = childrenRecursive;
  }

  Item.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['children_recursive'] != null) {
      _childrenRecursive = [];
      json['children_recursive'].forEach((v) {
        _childrenRecursive?.add(Item.fromJson(v));
      });
    }
  }

  num? _id;
  String? _title;
  dynamic _parentId;
  String? _createdAt;
  String? _updatedAt;
  List<Item>? _childrenRecursive;

  num? get id => _id;
  String? get title => _title;
  dynamic get parentId => _parentId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Item>? get childrenRecursive => _childrenRecursive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['parent_id'] = _parentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_childrenRecursive != null) {
      map['children_recursive'] =
          _childrenRecursive?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
