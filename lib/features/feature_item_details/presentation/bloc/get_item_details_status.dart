

import 'package:list_app_online/features/feature_item_details/data/model/ItemDetailsModel.dart';

abstract class GetItemDetailsStatus {}

// loading state
class GetItemDetailsLoading extends GetItemDetailsStatus{

}

// loaded state
class GetItemDetailsCompleted extends GetItemDetailsStatus{
  final ItemDetailsModel  itemDetailsModel;
  GetItemDetailsCompleted(this.itemDetailsModel);


}

// error state
class GetItemDetailsError extends GetItemDetailsStatus{
  final String? message;

  GetItemDetailsError(this.message);


}