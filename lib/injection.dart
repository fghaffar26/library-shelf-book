import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:library_shelf_book/data/repository/books_repository_impl.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:library_shelf_book/domain/usecases/get_all_books.dart';
import 'package:library_shelf_book/presentation/pages/home/bloc/home_bloc.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void init() {
  initRepository();
  initUseCase();
  initBloc();

  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton(() => Logger());
}

void initRepository() {
  getIt.registerLazySingleton<Booksrepository>(
    () => BooksRepositoryImpl(client: getIt.get<http.Client>()),
  );
}

void initUseCase() {
  getIt.registerLazySingleton(
    () => GetAllBooks(
      getIt.get<Booksrepository>(),
    ),
  );
}

void initBloc() {
  getIt.registerFactory(
    () => HomeBloc(getAllBooks: getIt.get<GetAllBooks>()),
  );
}
