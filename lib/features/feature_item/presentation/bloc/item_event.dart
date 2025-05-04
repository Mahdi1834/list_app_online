part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

/// گرفتن تمام آیتم‌ها
class GetAllItemsEvent extends ItemEvent {
  GetAllItemsEvent();
}

class GetAllItemsTreeEvent extends ItemEvent {
  GetAllItemsTreeEvent();
}

/// ذخیره آیتم جدید
class SaveItemEvent extends ItemEvent {
  final String title;
  final String? parent_id;

  SaveItemEvent({required this.title, this.parent_id});
}

/// حذف آیتم
class DeleteItemEvent extends ItemEvent {
  final  String item_id;

  DeleteItemEvent(this.item_id);
}

/// آپدیت آیتم
class UpdateItemEvent extends ItemEvent {
  final String title;
  final String? parent_id ;
  final String item_id;

  UpdateItemEvent({required this.title, this.parent_id, required this.item_id});
}
