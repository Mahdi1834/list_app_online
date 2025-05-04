

import 'package:list_app_online/features/feature_item/data/models/SaveItemModel.dart';

abstract class SaveItemStatus {}

class SaveItemInit extends SaveItemStatus {}

class SaveItemLoading extends SaveItemStatus {}

class SaveItemCompleted extends SaveItemStatus {
  final SaveItemModel saveItemModel;

  SaveItemCompleted(this.saveItemModel);
}

class SaveItemError extends SaveItemStatus {
  final String? message;

  SaveItemError(this.message);
}
