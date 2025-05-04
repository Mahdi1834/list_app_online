class DeleteItemModel {
  DeleteItemModel({
    num? status,
    List<dynamic>? data,
    String? message,
  }) {
    _status = status;
    _data = data;
    _message = message;
  }

  DeleteItemModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data']; // No parsing needed if it's just dynamic
    _message = json['message'];
  }

  num? _status;
  List<dynamic>? _data;
  String? _message;

  DeleteItemModel copyWith({
    num? status,
    List<dynamic>? data,
    String? message,
  }) =>
      DeleteItemModel(
        status: status ?? _status,
        data: data ?? _data,
        message: message ?? _message,
      );

  num? get status => _status;

  List<dynamic>? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }
}
