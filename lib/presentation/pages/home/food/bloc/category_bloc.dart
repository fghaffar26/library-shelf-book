import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_shelf_book/data/data_sources/category_food.dart';
import 'package:library_shelf_book/domain/usecases/get_all_books.dart';
import 'package:library_shelf_book/domain/usecases/get_all_category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategory getAllCategory;

  CategoryBloc({required this.getAllCategory}) : super(CategoryLoadingState()) {
    on<CategoryEvent>(_getCategory);
  }

  void _getCategory(CategoryEvent event, Emitter<CategoryState> emit) async {
    print('masuk kategori');
    final result = await getAllCategory.execute();

    await result.fold(
      (failure) async {
        emit(CategoryErrorState());
      },
      (response) async {
        emit(
          CategoryLoadedState(categories: response),
        );
      },
    );
  }
}
