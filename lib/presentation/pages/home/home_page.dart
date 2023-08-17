import 'package:flutter/material.dart';
import 'package:library_shelf_book/core/constant.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/presentation/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => AddBook()
          //       // BlocProvider.value(
          //       //     value: BlocProvider.of<SpecificBookBloc>(context),
          //       //     child: AddBook()),
          //       ),
          // );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: backgroundColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print('masuk builder');
          if (state is BooksLoadingState) {
            print('home page loading');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BooksLoadedState) {
            print('home page loaded');
            AllBooksResponse bookList = state.allBooksResponse;
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
                      itemCount: bookList.books?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        BooksModel? book = bookList.books?.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => BlocProvider.value(
                            //       value: BlocProvider.of<HomeBloc>(context),
                            //       child: DetailBook(id: index),
                            //     ),
                            //   ),
                            // );
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  book?.urlImage ?? ''.toString(),
                                  height: 170,
                                  width: 123,
                                ),
                                Text(book?.name ?? ''.toString()),
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
          }

          if (state is BooksErrorState) {
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
