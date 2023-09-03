import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_shelf_book/presentation/pages/home.dart';
import 'package:library_shelf_book/presentation/pages/home/bloc/home_bloc.dart';
import 'package:library_shelf_book/presentation/pages/home/food/bloc/category_bloc.dart';
import 'package:library_shelf_book/presentation/pages/home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_shelf_book/injection.dart' as di;

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => di.getIt<HomeBloc>()..add(LoadBookEvent()),
        ),
        BlocProvider(
          create: (context) =>
              di.getIt<CategoryBloc>()..add(GetFoodListEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return const MaterialApp(
            title: 'Flutter Demo',
            home:
                // Home(),
                HomePage(),
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }