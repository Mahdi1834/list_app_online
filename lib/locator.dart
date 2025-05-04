import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:list_app_online/features/feature_item/data/api/item_api_provider.dart';

import 'package:list_app_online/features/feature_item/presentation/bloc/item_bloc.dart';
import 'package:list_app_online/features/feature_item/repositories/item_repository.dart';
import 'package:list_app_online/features/feature_item_details/data/api/item_details_api_provider.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/item_details_bloc.dart';
import 'package:list_app_online/features/feature_item_details/repositories/item_details_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  ///api provider
  locator.registerSingleton<ItemApiProvider>(ItemApiProvider(locator()));
  locator.registerSingleton<ItemDetailsApiProvider>(ItemDetailsApiProvider(locator()));

  ///repository

  locator.registerSingleton<ItemRepository>(ItemRepository(locator()));
  locator.registerSingleton<ItemDetailsRepository>(ItemDetailsRepository(locator()));

  ///bloc
  locator.registerSingleton<ItemBloc>(ItemBloc(locator()));
  locator.registerSingleton<ItemDetailsBloc>(ItemDetailsBloc(locator()));
}
