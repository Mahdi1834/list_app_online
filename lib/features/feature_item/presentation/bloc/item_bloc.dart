import 'package:bloc/bloc.dart';
import 'package:list_app_online/core/resources/data_state.dart';

import 'package:list_app_online/features/feature_item/presentation/bloc/delete_item_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/get_all_item_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/get_all_item_tree_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/save_item_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/update_item_status.dart';
import 'package:list_app_online/features/feature_item/repositories/item_repository.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc(this.itemRepository)
      : super(ItemState(
          getAllItemTreeStatus: GetAllItemTreeLoading(),
          getAllItemStatus: GetAllItemLoading(),
          saveItemStatus: SaveItemInit(),
          deleteItemStatus: DeleteItemInit(),
          updateItemStatus: UpdateItemInit(),
        )) {
    // ذخیره آیتم
    on<SaveItemEvent>((event, emit) async {
      emit(state.copyWith(newSaveItemStatus: SaveItemLoading()));

      DataState dataState  = await itemRepository.saveItemToDB(title:  event.title , parent_id: event.parent_id);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newSaveItemStatus: SaveItemCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newSaveItemStatus: SaveItemError(dataState.error)));
      }
    });

    // آپدیت آیتم
    on<UpdateItemEvent>((event, emit) async {
      emit(state.copyWith(newUpdateItemStatus: UpdateItemLoading()));

      DataState dataState = await itemRepository.updateItemToDB(title: event.title , item_id: event.item_id , parent_id: event.parent_id);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newUpdateItemStatus: UpdateItemCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newUpdateItemStatus: UpdateItemError(dataState.error)));
      }
    });

    // حذف آیتم
    on<DeleteItemEvent>((event, emit) async {
      emit(state.copyWith(newDeleteItemStatus: DeleteItemLoading()));

      DataState dataState = await itemRepository.deleteItem(item_id: event.item_id);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newDeleteItemStatus: DeleteItemCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newDeleteItemStatus: DeleteItemError(dataState.error)));
      }
    });

    // گرفتن همه آیتم‌ها
    on<GetAllItemsEvent>((event, emit) async {
      emit(state.copyWith(newGetAllItemStatus: GetAllItemLoading()));

      DataState dataState = await itemRepository.getAllItem();

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGetAllItemStatus: GetAllItemCompleted(dataState.data!)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newGetAllItemStatus: GetAllItemError(dataState.error)));
      }
    });

    on<GetAllItemsTreeEvent>((event, emit) async {
      emit(state.copyWith(newGetAllItemTreeStatus: GetAllItemTreeLoading()));

      DataState dataState = await itemRepository.getAllItemTree();

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGetAllItemTreeStatus: GetAllItemTreeCompleted(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(
            newGetAllItemTreeStatus: GetAllItemTreeError(dataState.error)));
      }
    });
  }
}
