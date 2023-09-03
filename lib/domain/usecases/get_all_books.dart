import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/failure.dart';

class GetAllBooks {
  final Booksrepository repository;

  GetAllBooks(this.repository);
  Future<Either<Failure, AllBooksResponse>> execute() {
    print('masuk usecases');
    return repository.getAllBooks();
  }
}
