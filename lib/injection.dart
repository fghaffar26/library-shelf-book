import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:library_shelf_book/data/repository/books_repository_impl.dart';
import 'package:library_shelf_book/data/repository/category_repository_impl.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:library_shelf_book/domain/repository/category_repository.dart';
import 'package:library_shelf_book/domain/usecases/get_all_books.dart';
import 'package:library_shelf_book/domain/usecases/get_all_category.dart';
import 'package:library_shelf_book/presentation/pages/home/bloc/home_bloc.dart';
import 'package:library_shelf_book/presentation/pages/home/food/bloc/category_bloc.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

void init() {
  initRepository();
  initUseCase();
  initBloc();

  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton(() => Logger());
  print('masuk init');
}

void initRepository() {
  print('masuk initRepo');
  getIt.registerLazySingleton<Booksrepository>(
    () => BooksRepositoryImpl(),
  );

  getIt.registerLazySingleton<CategoryFoodrepository>(
    () => CategoryFoodRepositoryImpl(),
  );
}

void initUseCase() {
  print('masuk initUseCase');
  getIt.registerLazySingleton(
    () => GetAllBooks(
      getIt.get<Booksrepository>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetAllCategory(
      getIt.get<CategoryFoodrepository>(),
    ),
  );
}

void initBloc() {
  print('masuk initBloc');
  getIt.registerFactory(
    () => HomeBloc(getAllBooks: getIt.get<GetAllBooks>()),
  );

  getIt.registerFactory(
    () => CategoryBloc(getAllCategory: getIt.get<GetAllCategory>()),
  );
}
