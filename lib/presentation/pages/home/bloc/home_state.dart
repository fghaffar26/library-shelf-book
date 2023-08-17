part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class BooksInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class BooksLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class BooksLoadedState extends HomeState {
  final AllBooksResponse allBooksResponse;
  const BooksLoadedState({required this.allBooksResponse});
  @override
  List<Object> get props => [allBooksResponse];
}

class BooksErrorState extends HomeState {
  // final String error;
  // BooksErrorState(this.error);
  @override
  List<Object> get props => [];
}
