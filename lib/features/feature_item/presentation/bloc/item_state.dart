part of 'item_bloc.dart';

class ItemState {
  GetAllItemStatus getAllItemStatus;
  SaveItemStatus saveItemStatus;
  DeleteItemStatus deleteItemStatus;
  UpdateItemStatus updateItemStatus;
  GetAllItemTreeStatus getAllItemTreeStatus;

  ItemState(
      {required this.getAllItemStatus,
      required this.saveItemStatus,
      required this.getAllItemTreeStatus,
      required this.deleteItemStatus,
      required this.updateItemStatus});

  ItemState copyWith({
    GetAllItemStatus? newGetAllItemStatus,
    SaveItemStatus? newSaveItemStatus,
    DeleteItemStatus? newDeleteItemStatus,
    UpdateItemStatus? newUpdateItemStatus,
    GetAllItemTreeStatus? newGetAllItemTreeStatus,
  }) {
    return ItemState(
        getAllItemTreeStatus: newGetAllItemTreeStatus ?? getAllItemTreeStatus,
        getAllItemStatus: newGetAllItemStatus ?? getAllItemStatus,
        saveItemStatus: newSaveItemStatus ?? saveItemStatus,
        deleteItemStatus: newDeleteItemStatus ?? deleteItemStatus,
        updateItemStatus: newUpdateItemStatus ?? updateItemStatus);
  }
}
