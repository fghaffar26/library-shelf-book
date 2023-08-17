part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadBookEvent extends HomeEvent {
  final String books;

  const LoadBookEvent(this.books);

  @override
  List<Object> get props => [];
}
