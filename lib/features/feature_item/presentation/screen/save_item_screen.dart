import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:list_app_online/core/config/showFlushbar.dart';
import 'package:list_app_online/core/widgets/dot_loading_widget.dart';
import 'package:list_app_online/features/feature_item/data/models/ItemModelAll.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/get_all_item_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/item_bloc.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/save_item_status.dart';

class SaveItemScreen extends StatefulWidget {
  static const routeName = "/save_item_screen";

  const SaveItemScreen({super.key});

  @override
  State<SaveItemScreen> createState() => _SaveItemScreenState();
}

class _SaveItemScreenState extends State<SaveItemScreen> {
  final TextEditingController _titleController = TextEditingController();
  Items? selectedParent;
  List<Items> allItems = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetAllItemsEvent());
  }

  void _saveItem() {
    String title = _titleController.text.trim();

    if (title.isEmpty) {
      showFlushbar(context, "عنوان را وارد کنید", false);
      return;
    }

    BlocProvider.of<ItemBloc>(context).add(
        SaveItemEvent(title: title, parent_id: selectedParent?.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ذخیره فهرست")),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ItemBloc, ItemState>(
            listenWhen: (previous, current) {
              if (current.getAllItemStatus == previous.getAllItemStatus) {
                return false;
              }
              return true;
            },
            listener: (context, state) {
              if (state.getAllItemStatus is GetAllItemCompleted) {
                GetAllItemCompleted getAllItemCompleted =
                    state.getAllItemStatus as GetAllItemCompleted;
                ItemModelAll itemModelAll = getAllItemCompleted.itemModelAll;
                List<Items>? items = itemModelAll.data?.items;

                if (items != null) {
                  setState(() {
                    allItems = items;
                  });
                }
              }
            },
            builder: (context, state) {
              if (state.getAllItemStatus is GetAllItemLoading) {
                return Center(
                  child: DotLoadingWidget(size: 30),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: "عنوان آیتم"),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<Items>(
                    value: selectedParent,
                    hint: const Text("انتخاب والد (اختیاری)"),
                    isExpanded: true,
                    items: allItems.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item.title!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedParent = value;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.saveItemStatus is SaveItemLoading
                          ? null
                          : _saveItem,
                      child: state.saveItemStatus is SaveItemLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("ذخیره"),
                    ),
                  ),
                  BlocConsumer<ItemBloc, ItemState>(
                    listenWhen: (previous, current) {
                      if (current.saveItemStatus == previous.saveItemStatus) {
                        return false;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      if (state.saveItemStatus is SaveItemLoading) {
                        return const DotLoadingWidget(size: 30);
                      }
                      return const SizedBox.shrink();
                    },
                    listener: (context, state) async {
                      if (state.saveItemStatus is SaveItemCompleted) {
                        await showFlushbar(
                            context, "آیتم با موفقیت ذخیره شد", true);
                        BlocProvider.of<ItemBloc>(context)
                            .add(GetAllItemsTreeEvent());
                        BlocProvider.of<ItemBloc>(context)
                            .add(GetAllItemsEvent());
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                        // });
                      }
                      if (state.saveItemStatus is SaveItemError) {
                        String? error =
                            (state.saveItemStatus as SaveItemError).message;

                        showFlushbar(
                            context, error ?? "خطا در ذخیره‌سازی", false);
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
