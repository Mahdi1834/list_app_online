import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_app_online/features/feature_item/presentation/bloc/item_bloc.dart';
import 'package:list_app_online/features/feature_item/presentation/screen/item_screen.dart';
import 'package:list_app_online/features/feature_item/presentation/screen/save_item_screen.dart';
import 'package:list_app_online/features/feature_item_details/presentation/bloc/item_details_bloc.dart';
import 'package:list_app_online/features/feature_item_details/presentation/screen/item_details_screen.dart';
import 'package:list_app_online/locator.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => locator<ItemBloc>()),
    BlocProvider(create: (_) => locator<ItemDetailsBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'IranSans',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blue
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ItemScreen(),
      routes: {
        ItemScreen.routeName: (context) => const ItemScreen(),
        SaveItemScreen.routeName: (context) => const SaveItemScreen(),
        ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
      },
    );
  }
}
