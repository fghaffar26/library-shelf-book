import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/core/failure.dart';
import 'package:library_shelf_book/data/data_sources/category_food.dart';
import 'package:http/http.dart' as http;
import 'package:library_shelf_book/domain/repository/category_repository.dart';

import '../../core/base_url.dart';

class CategoryFoodRepositoryImpl extends CategoryFoodrepository {
  final http.Client _client = http.Client();

  // BooksRepositoryImpl({required this._client});

  @override
  Future<Either<Failure, CategoryFood>> getAllCategory() async {
    print('masuk repo impl');

    try {
      // var uri = Uri.parse(url);
      print('masuk try');
      var response = await _client
          .get(Uri.parse('www.themealdb.com/api/json/v1/1/categories.php'));
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);
        String jsonDataString = response.body.toString();
        var jsonData = jsonDecode(jsonDataString);
        return Right(CategoryFood.fromJson(jsonData));
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      return Left(ServerFailure(""));
    }
  }
}
