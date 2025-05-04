class SaveItemModel {
  SaveItemModel({
      num? status, 
      Data? data, 
      String? message,}){
    _status = status;
    _data = data;
    _message = message;
}

  SaveItemModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  num? _status;
  Data? _data;
  String? _message;
SaveItemModel copyWith({  num? status,
  Data? data,
  String? message,
}) => SaveItemModel(  status: status ?? _status,
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
      String? title, 
      String? parentId, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _title = title;
    _parentId = parentId;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _parentId = json['parent_id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _title;
  String? _parentId;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Data copyWith({  String? title,
  String? parentId,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Data(  title: title ?? _title,
  parentId: parentId ?? _parentId,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get title => _title;
  String? get parentId => _parentId;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['parent_id'] = _parentId;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}