import 'package:list_app_online/features/feature_item/data/models/ItemModelParent.dart';

abstract class GetAllItemTreeStatus {}

// loading state
class GetAllItemTreeLoading extends GetAllItemTreeStatus{

}

// loaded state
class GetAllItemTreeCompleted extends GetAllItemTreeStatus{
  final ItemModelParent itemModelParent;
  GetAllItemTreeCompleted(this.itemModelParent);


}

// error state
class GetAllItemTreeError extends GetAllItemTreeStatus{
  final String? message;

  GetAllItemTreeError(this.message);


}