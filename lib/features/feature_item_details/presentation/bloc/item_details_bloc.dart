import 'package:bloc/bloc.dart';
import 'package:list_app_online/core/resources/data_state.dart';

import 'package:list_app_online/features/feature_item_details/presentation/bloc/get_item_details_status.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/save_item_details_status.dart';
import 'package:list_app_online/features/feature_item_details/repositories/item_details_repository.dart';
import 'package:meta/meta.dart';

part 'item_details_event.dart';

part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  final ItemDetailsRepository itemDetailsRepository;

  ItemDetailsBloc(this.itemDetailsRepository)
      : super(ItemDetailsState(
          getItemDetailsStatus: GetItemDetailsLoading(),
          saveItemDetailsStatus: SaveItemDetailsInit(),
        )) {
    // درج یا آپدیت توضیح
    on<UpsertItemDetailEvent>((event, emit) async {
      emit(state.copyWith(newSaveItemDetailsStatus: SaveItemDetailsLoading()));


      DataState dataState =
          await itemDetailsRepository.saveItemDetailsToDB(description: event.description , item_id: event.itemId.toString());

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newSaveItemDetailsStatus:
                SaveItemDetailsCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newSaveItemDetailsStatus: SaveItemDetailsError(dataState.error)));
      }
    });

// دریافت توضیح براساس itemId

    on<GetItemDetailByItemIdEvent>((event, emit) async {
      emit(state.copyWith(newGetItemDetailsStatus: GetItemDetailsLoading()));

      DataState dataState =
          await itemDetailsRepository.getItemDetails(item_id: event.itemId.toString());

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGetItemDetailsStatus: GetItemDetailsCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newGetItemDetailsStatus: GetItemDetailsError(dataState.error)));
      }
    });
  }
}
