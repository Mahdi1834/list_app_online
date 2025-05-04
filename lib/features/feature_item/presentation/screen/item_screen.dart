import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_app_online/core/config/showFlushbar.dart';
import 'package:list_app_online/core/widgets/dot_loading_widget.dart';
import 'package:list_app_online/features/feature_item/data/models/ItemModelParent.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/delete_item_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/get_all_item_tree_status.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/item_bloc.dart';
import 'package:list_app_online/features/feature_item/presentation/screen/save_item_screen.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/item_details_bloc.dart';
import 'package:list_app_online/features/feature_item_details/presentation/screen/item_details_screen.dart';


class ItemScreen extends StatefulWidget {
  static const routeName = '/item_screen';

  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(GetAllItemsTreeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("فهرست"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SaveItemScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocConsumer<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state.getAllItemTreeStatus is GetAllItemTreeLoading) {
              return const DotLoadingWidget(size: 50);
            }
            if (state.getAllItemTreeStatus is GetAllItemTreeError) {
              GetAllItemTreeError getAllItemTreeError =
                  state.getAllItemTreeStatus as GetAllItemTreeError;
              String? message = getAllItemTreeError.message;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "خطا",
                      style: TextStyle(fontSize: 17, color: Colors.red),
                    ),
                    Text(
                      message!,
                      style: const TextStyle(fontSize: 17, color: Colors.red),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple),
                        onPressed: () {
                          BlocProvider.of<ItemBloc>(context)
                              .add(GetAllItemsTreeEvent());
                        },
                        child: const Text(
                          "تلاش مجدد",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              );
            }

            if (state.getAllItemTreeStatus is GetAllItemTreeCompleted) {
              GetAllItemTreeCompleted getAllItemTreeCompleted =
                  state.getAllItemTreeStatus as GetAllItemTreeCompleted;
              ItemModelParent itemModelParent = getAllItemTreeCompleted.itemModelParent;

              final items = itemModelParent.data?.items ?? [];

              return ListView(
                children: items.map((item) => buildTree(item)).toList(),
              );
            }
            return const SizedBox.shrink();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  Widget buildTree(Item item, {int level = 0}) {
    const Color baseColor = Colors.blueAccent;
    final double opacity =
        (1 - (level * 0.1)).clamp(0.4, 1.0); // از پررنگ به کم‌رنگ
    final Color levelColor = baseColor.withOpacity(opacity);

    return Card(
      elevation: 2,
      color: levelColor.withOpacity(0.15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Row(
          children: [
            Expanded(
              child: Text(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                item.title!,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.green),
              onPressed: () {
                // نمایش آیتم
                BlocProvider.of<ItemDetailsBloc>(context)
                    .add(GetItemDetailByItemIdEvent(item.id!.toInt()));
                Navigator.pushNamed(context, ItemDetailsScreen.routeName,
                    arguments: item.id!);
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.edit, color: Colors.orange),
            //   onPressed: () {
            //     // ویرایش آیتم
            //   },
            // ),
            BlocConsumer<ItemBloc, ItemState>(
              listenWhen: (previous, current) {
                if (previous.deleteItemStatus == current.deleteItemStatus) {
                  return false;
                }
                return true;
              },
              listener: (context, state) {
                // TODO: implement listener
                if (state.deleteItemStatus is DeleteItemCompleted) {
                  showFlushbar(context, "با موفقیت حذف شد", true);
                  BlocProvider.of<ItemBloc>(context)
                      .add(GetAllItemsTreeEvent());
                }
                if (state.deleteItemStatus is DeleteItemError) {
                  DeleteItemError deleteItemError =
                      state.deleteItemStatus as DeleteItemError;
                  showFlushbar(context,
                      deleteItemError.message ?? "خطا هنگام حذف", false);
                }
              },
              builder: (context, state) {
                if (state.deleteItemStatus is DeleteItemLoading) {
                  return DotLoadingWidget(size: 20);
                }
                return IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('تأیید حذف'),
                        content: const Text(
                            'آیا از حذف این آیتم اطمینان دارید؟ تمام فرزندان و توضیحات آن نیز حذف خواهد شد.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('لغو'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('حذف'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      BlocProvider.of<ItemBloc>(context)
                          .add(DeleteItemEvent(item.id.toString()));
                    }
                  },
                );
              },
            ),
          ],
        ),
        children: item.childrenRecursive
            ?.map((child) => buildTree(child, level: level + 1))
            .toList() ?? [],
      ),
    );
  }
// }
}
