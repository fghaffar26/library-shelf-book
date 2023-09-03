part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

final class CategoryLoadedState extends CategoryState {
  final CategoryFood categories;

  const CategoryLoadedState({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  // final String error;
  // BooksErrorState(this.error);
  @override
  List<Object> get props => [];
}
