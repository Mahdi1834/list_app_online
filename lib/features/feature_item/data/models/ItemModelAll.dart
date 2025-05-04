class ItemModelAll {
  ItemModelAll({
    num? status,
    Data? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  ItemModelAll.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  num? _status;
  Data? _data;
  String? _message;

  ItemModelAll copyWith({
    num? status,
    Data? data,
    String? message,
  }) =>
      ItemModelAll(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );

  num? get status => _status;

  Data? get data => _data;

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

class Data {
  Data({
    List<Items>? items,
  }) {
    _items = items;
  }

  Data.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  List<Items>? _items;

  Data copyWith({
    List<Items>? items,
  }) =>
      Data(
        items: items ?? _items,
      );

  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Items {
  Items({
    num? id,
    String? title,
    dynamic parentId,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _parentId = parentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _title;
  dynamic _parentId;
  String? _createdAt;
  String? _updatedAt;

  Items copyWith({
    num? id,
    String? title,
    dynamic parentId,
    String? createdAt,
    String? updatedAt,
  }) =>
      Items(
        id: id ?? _id,
        title: title ?? _title,
        parentId: parentId ?? _parentId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get title => _title;

  dynamic get parentId => _parentId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['parent_id'] = _parentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
