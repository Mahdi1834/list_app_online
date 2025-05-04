import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_app_online/core/config/showFlushbar.dart';
import 'package:list_app_online/core/widgets/dot_loading_widget.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/get_item_details_status.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/item_details_bloc.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/save_item_details_status.dart';

class ItemDetailsScreen extends StatefulWidget {
  static const routeName = "/item_details_screen";

  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  late int itemId;
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // گرفتن پارامتر از route
    itemId = ModalRoute.of(context)!.settings.arguments as int;

    // ارسال رویداد برای گرفتن اطلاعات
    context.read<ItemDetailsBloc>().add(GetItemDetailByItemIdEvent(itemId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("توضیحات آیتم"),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
            buildWhen: (previous, current) {
              if(previous.getItemDetailsStatus == current.getItemDetailsStatus){
                return false;
              }
              return true;
            },

            builder: (context, state) {
              if (state.getItemDetailsStatus is GetItemDetailsLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.getItemDetailsStatus is GetItemDetailsCompleted) {
                final data =
                    (state.getItemDetailsStatus as GetItemDetailsCompleted)
                        .itemDetailsModel;
                _controller.text = data.data?.description ?? '';
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'توضیحات',
                        border: OutlineInputBorder(),
                      ),
                      expands: true, // این باعث میشه کل فضای ممکن رو بگیره
                      maxLines: null,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    onPressed: () {
                      context.read<ItemDetailsBloc>().add(
                            UpsertItemDetailEvent(
                              description: _controller.text,
                              itemId: itemId,
                            ),
                          );

                    },
                    icon: Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    label: Text(
                      "ذخیره",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  BlocConsumer<ItemDetailsBloc, ItemDetailsState>(

                    listenWhen: (previous, current) {
                      if(previous.saveItemDetailsStatus == current.saveItemDetailsStatus){
                        return false;
                      }
                      return true;
                    },
                    buildWhen: (previous, current) {
                      if(previous.saveItemDetailsStatus == current.saveItemDetailsStatus){
                        return false;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      if (state.saveItemDetailsStatus
                          is SaveItemDetailsLoading) {
                        return DotLoadingWidget(size: 30);
                      }
                      return SizedBox.shrink();
                    },
                    listener: (context, state) async {
                      if (state.saveItemDetailsStatus
                          is SaveItemDetailsCompleted) {
                        await showFlushbar(context, "باموفقیت ذخیره شد", true);

                      }

                      if (state.saveItemDetailsStatus
                      is SaveItemDetailsError) {
                        SaveItemDetailsError saveItemDetailsError =
                        state.saveItemDetailsStatus
                        as SaveItemDetailsError;
                        String? message = saveItemDetailsError.message;
                        showFlushbar(context, message ?? "خطا", false);
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
