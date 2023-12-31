import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/core/failure.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:http/http.dart' as http;

import '../../core/base_url.dart';

class BooksRepositoryImpl extends Booksrepository {
  final http.Client _client = http.Client();

  // BooksRepositoryImpl({required this._client});

  @override
  Future<Either<Failure, AllBooksResponse>> getAllBooks() async {
    print('masuk repo impl');

    try {
      // var uri = Uri.parse(url);
      print('masuk try');
      var response = await _client.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);
        String jsonDataString = response.body.toString();
        var jsonData = jsonDecode(jsonDataString);
        return Right(AllBooksResponse.fromJson(jsonData));
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      return Left(ServerFailure(""));
    }
  }
}
