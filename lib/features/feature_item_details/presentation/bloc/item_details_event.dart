part of 'item_details_bloc.dart';

@immutable
sealed class ItemDetailsEvent {}

/// دریافت توضیحات بر اساس آیتم
class GetItemDetailByItemIdEvent extends ItemDetailsEvent {
  final int itemId;

  GetItemDetailByItemIdEvent(this.itemId);
}

/// درج یا آپدیت توضیحات برای یک آیتم خاص
class UpsertItemDetailEvent extends ItemDetailsEvent {
  final String description;
  final int itemId;

  UpsertItemDetailEvent({required this.description, required this.itemId});
}

/// حذف توضیحات بر اساس آیتم (اختیاری)
class DeleteItemDetailByItemIdEvent extends ItemDetailsEvent {
  final int itemId;

  DeleteItemDetailByItemIdEvent(this.itemId);
}
