

import 'package:list_app_online/features/feature_item/data/models/SaveItemModel.dart';

abstract class UpdateItemStatus {}

class UpdateItemInit extends UpdateItemStatus {}

class UpdateItemLoading extends UpdateItemStatus {}

class UpdateItemCompleted extends UpdateItemStatus {
  final SaveItemModel saveItemModel;

  UpdateItemCompleted(this.saveItemModel);
}

class UpdateItemError extends UpdateItemStatus {
  final String? message;

  UpdateItemError(this.message);
}
