import 'package:flutter/material.dart';
import 'package:library_shelf_book/core/constant.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/data/data_sources/category_food.dart';
import 'package:library_shelf_book/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_shelf_book/presentation/pages/home/food/bloc/category_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rak Buku",
          style: TextStyle(color: white),
        ),
        elevation: 0,
        backgroundColor: base,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: base,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print('masuk builder');
          print(state);

          if (state is CategoryLoadedState) {
            print('home page loaded');
            CategoryFood? categoryList = state.categories;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 230,
                        crossAxisCount: 2,
                        // childAspectRatio: 0.717,
                        mainAxisSpacing: 16,
                        // crossAxisSpacing: 5,
                      ),
                      itemCount: categoryList.categories?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Categories? cat =
                            categoryList.categories?.elementAt(index);
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  cat?.strCategoryThumb ?? ''.toString(),
                                  height: 170,
                                  width: 123,
                                ),
                                Text(cat?.strCategory ?? ''.toString()),
                                Text(cat?.strCategoryDescription ??
                                    ''.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            );
          } else if (state is CategoryLoadingState) {
            print('home page loading');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryErrorState) {
            print('home page error');
            return const Center(
              child: Text("Error"),
            );
          }
          return SingleChildScrollView();
        },
      ),
    );
  }
}
