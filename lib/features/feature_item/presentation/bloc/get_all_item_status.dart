
import 'package:list_app_online/features/feature_item/data/models/ItemModelAll.dart';


abstract class GetAllItemStatus {}

// loading state
class GetAllItemLoading extends GetAllItemStatus{

}

// loaded state
class GetAllItemCompleted extends GetAllItemStatus{
  final ItemModelAll itemModelAll;
  GetAllItemCompleted(this.itemModelAll);


}

// error state
class GetAllItemError extends GetAllItemStatus{
  final String? message;

  GetAllItemError(this.message);


}