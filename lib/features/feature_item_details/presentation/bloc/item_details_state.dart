part of 'item_details_bloc.dart';

class ItemDetailsState {
  GetItemDetailsStatus getItemDetailsStatus;
  SaveItemDetailsStatus saveItemDetailsStatus;

  ItemDetailsState(
      {required this.getItemDetailsStatus,
      required this.saveItemDetailsStatus});

  ItemDetailsState copyWith(
      {GetItemDetailsStatus? newGetItemDetailsStatus,
      SaveItemDetailsStatus? newSaveItemDetailsStatus}) {
    return ItemDetailsState(
        getItemDetailsStatus: newGetItemDetailsStatus ?? getItemDetailsStatus,
        saveItemDetailsStatus:
            newSaveItemDetailsStatus ?? saveItemDetailsStatus);
  }
}
