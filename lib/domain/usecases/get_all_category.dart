import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/data/data_sources/category_food.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/domain/repository/category_repository.dart';

import '../../core/failure.dart';

class GetAllCategory {
  final CategoryFoodrepository repository;

  GetAllCategory(this.repository);
  Future<Either<Failure, CategoryFood>> execute() {
    print('masuk usecases');
    return repository.getAllCategory();
  }
}
