import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';

import '../../core/failure.dart';

abstract class Booksrepository {
  Future<Either<Failure, AllBooksResponse>> getAllBooks();
}
