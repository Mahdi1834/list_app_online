
import 'package:list_app_online/features/feature_item/data/models/DeleteItemModel.dart';

abstract class DeleteItemStatus {}

class DeleteItemInit extends DeleteItemStatus {}

class DeleteItemLoading extends DeleteItemStatus {}

class DeleteItemCompleted extends DeleteItemStatus {
  final DeleteItemModel deleteItemModel;

  DeleteItemCompleted(this.deleteItemModel);
}

class DeleteItemError extends DeleteItemStatus {
  final String? message;

  DeleteItemError(this.message);
}
