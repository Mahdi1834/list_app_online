import 'package:dio/dio.dart';

import 'package:list_app_online/core/config/constants.dart';

class ItemApiProvider {
  Dio dio;

  ItemApiProvider(this.dio);

  Future<dynamic> getItemParent() async {
    final response = await dio.get(
      "${Constants.baseUrl}/items",
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    print(response.toString());
    return response;
  }

  Future<dynamic> SaveItem({required String title, String? parent_id}) async {
    final response = await dio.post(
      "${Constants.baseUrl}/items",
      data: {
        "title": title,
        if (parent_id != null) "parent_id": parent_id,
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

  Future<dynamic> UpdateItem({required String title, String? parent_id , required String item_id}) async {
    final response = await dio.put(
      "${Constants.baseUrl}/items/${item_id}",
      data: {
        "title": title,
        if (parent_id != null) "parent_id": parent_id,
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

  Future<dynamic> deleteItem({ required String item_id}) async {
    final response = await dio.delete(
      "${Constants.baseUrl}/items/${item_id}",
      options: Options(
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    print(response.toString());
    return response;
  }

  Future<dynamic> getItemAll() async {
    final response = await dio.get(
      "${Constants.baseUrl}/items/all",
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
