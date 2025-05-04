

import 'package:list_app_online/features/feature_item_details/data/model/ItemDetailsModel.dart';

abstract class SaveItemDetailsStatus {}

class SaveItemDetailsInit extends SaveItemDetailsStatus {}

class SaveItemDetailsLoading extends SaveItemDetailsStatus {}

class SaveItemDetailsCompleted extends SaveItemDetailsStatus {
  final ItemDetailsModel itemDetailsModel;

  SaveItemDetailsCompleted(this.itemDetailsModel);
}

class SaveItemDetailsError extends SaveItemDetailsStatus {
  final String? message;

  SaveItemDetailsError(this.message);
}
