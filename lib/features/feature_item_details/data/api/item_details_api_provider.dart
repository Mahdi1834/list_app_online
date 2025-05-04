import 'package:dio/dio.dart';

import 'package:list_app_online/core/config/constants.dart';

class ItemDetailsApiProvider {
  Dio dio;

  ItemDetailsApiProvider(this.dio);

  Future<dynamic> getItemDetailsParent({required String item_id}) async {
    final response = await dio.get(
      "${Constants.baseUrl}/items/${item_id}/details",
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    print(response.toString());
    return response;
  }

  Future<dynamic> SaveItemDetails({required String description, required String item_id}) async {
    final response = await dio.post(
      "${Constants.baseUrl}/items/saveDetails",
      data: {
        "item_id": item_id,
        "description": description,

      },
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    print(response.toString());
    return response;
  }


}
