class ItemDetailsModel {
  ItemDetailsModel({
    num? status,
    Data? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  ItemDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  num? _status;
  Data? _data;
  String? _message;

  ItemDetailsModel copyWith({
    num? status,
    Data? data,
    String? message,
  }) =>
      ItemDetailsModel(
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
    num? id,
    String? description,
    String? itemId, // changed from num? to String?
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _description = description;
    _itemId = itemId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _itemId = json['item_id']?.toString(); // safe conversion to String
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _description;
  String? _itemId; // now a String
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    num? id,
    String? description,
    String? itemId,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        description: description ?? _description,
        itemId: itemId ?? _itemId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;
  String? get description => _description;
  String? get itemId => _itemId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['item_id'] = _itemId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

