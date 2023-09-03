import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/data/data_sources/category_food.dart';

import '../../core/failure.dart';

abstract class CategoryFoodrepository {
  Future<Either<Failure, CategoryFood>> getAllCategory();
}
