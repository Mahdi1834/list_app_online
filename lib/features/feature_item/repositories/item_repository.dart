

import 'package:dio/dio.dart';
import 'package:list_app_online/core/error_handling/get_message.dart';
import 'package:list_app_online/core/resources/data_state.dart';
import 'package:list_app_online/features/feature_item/data/api/item_api_provider.dart';
import 'package:list_app_online/features/feature_item/data/models/DeleteItemModel.dart';
import 'package:list_app_online/features/feature_item/data/models/ItemModelAll.dart';
import 'package:list_app_online/features/feature_item/data/models/ItemModelParent.dart';
import 'package:list_app_online/features/feature_item/data/models/SaveItemModel.dart';

class ItemRepository{
 ItemApiProvider apiProvider;

 ItemRepository(this.apiProvider);

  Future<DataState<SaveItemModel>> saveItemToDB({required String title, String? parent_id}) async {
    try {
      // insert city to database

      Response response =   await apiProvider.SaveItem(title:title , parent_id: parent_id );
      if (response.statusCode == 200) {
        final SaveItemModel saveItemModel = SaveItemModel.fromJson(response.data);
        return DataSuccess(saveItemModel);
      } else {
        return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
      }
    } on DioException catch (e) {
      return DataFailed(getMessage(e));
    }
  }


 Future<DataState<SaveItemModel>>updateItemToDB({required String title, String? parent_id , required String item_id}) async {
   try {
     // insert city to database

     Response response =   await apiProvider.UpdateItem(title:title , parent_id: parent_id , item_id: item_id);
     if (response.statusCode == 200) {
       final SaveItemModel saveItemModel = SaveItemModel.fromJson(response.data);
       return DataSuccess(saveItemModel);
     } else {
       return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
     }
   } on DioException catch (e) {
     return DataFailed(getMessage(e));
   }
 }



 Future<DataState<DeleteItemModel>> deleteItem({required String item_id}) async {
   try {
     // insert city to database

     Response response =   await apiProvider.deleteItem(item_id: item_id);
     if (response.statusCode == 200) {
       final DeleteItemModel deleteItemModel = DeleteItemModel.fromJson(response.data);
       return DataSuccess(deleteItemModel);
     } else {
       return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
     }
   } on DioException catch (e) {
     return DataFailed(getMessage(e));
   }
 }



 /// call get All descriptions from DB and set status

 Future<DataState<ItemModelParent>> getAllItemTree() async {
   try {
     // insert city to database

     Response response =   await apiProvider.getItemParent();
     if (response.statusCode == 200) {
       final ItemModelParent itemModelParent = ItemModelParent.fromJson(response.data);
       return DataSuccess(itemModelParent);
     } else {
       return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
     }
   } on DioException catch (e) {
     return DataFailed(getMessage(e));
   }
 }



  Future<DataState<ItemModelAll>> getAllItem() async {
    try {
      // insert city to database

      Response response =   await apiProvider.getItemAll();
      if (response.statusCode == 200) {
        final ItemModelAll itemModelAll = ItemModelAll.fromJson(response.data);
        return DataSuccess(itemModelAll);
      } else {
        return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
      }
    } on DioException catch (e) {
      return DataFailed(getMessage(e));
    }
  }






}