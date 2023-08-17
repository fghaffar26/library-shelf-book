import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/domain/usecases/get_all_books.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllBooks getAllBooks;

  HomeBloc({required this.getAllBooks}) : super(BooksInitialState()) {
    on<LoadBookEvent>(_getBookList);
  }

  void _getBookList(LoadBookEvent event, Emitter<HomeState> emit) async {
    emit(BooksLoadingState());
    final result = await getAllBooks.execute(event.books);

    await result.fold(
      (failure) async {
        emit(BooksErrorState());
      },
      (response) async {
        emit(
          BooksLoadedState(allBooksResponse: response),
        );
      },
    );
  }
}
