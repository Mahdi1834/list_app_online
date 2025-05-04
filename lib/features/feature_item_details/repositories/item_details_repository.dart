

import 'package:dio/dio.dart';
import 'package:list_app_online/core/error_handling/get_message.dart';
import 'package:list_app_online/core/resources/data_state.dart';
import 'package:list_app_online/features/feature_item_details/data/api/item_details_api_provider.dart';
import 'package:list_app_online/features/feature_item_details/data/model/ItemDetailsModel.dart';


class ItemDetailsRepository{
  ItemDetailsApiProvider apiProvider;

  ItemDetailsRepository(this.apiProvider);

  Future<DataState<ItemDetailsModel>> saveItemDetailsToDB({required String description, required String item_id}) async {
    try {
      // insert city to database

      Response response =   await apiProvider.SaveItemDetails(item_id: item_id , description: description);
      if (response.statusCode == 200) {
        final ItemDetailsModel itemDetailsModel = ItemDetailsModel.fromJson(response.data);
        return DataSuccess(itemDetailsModel);
      } else {
        return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
      }
    } on DioException catch (e) {
      return DataFailed(getMessage(e));
    }
  }


  Future<DataState<ItemDetailsModel>> getItemDetails({ required String item_id}) async {
    try {
      // insert city to database

      Response response =   await apiProvider.getItemDetailsParent(item_id: item_id );
      if (response.statusCode == 200) {
        final ItemDetailsModel itemDetailsModel = ItemDetailsModel.fromJson(response.data);
        return DataSuccess(itemDetailsModel);
      } else {
        return const DataFailed("خطا هنگام دریافت اطلاعات !!!");
      }
    } on DioException catch (e) {
      return DataFailed(getMessage(e));
    }
  }









}