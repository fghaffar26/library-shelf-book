import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:library_shelf_book/core/failure.dart';
import 'package:library_shelf_book/data/data_sources/all_books_response.dart';
import 'package:library_shelf_book/domain/repository/books_repository.dart';
import 'package:http/http.dart' as http;

import '../../core/base_url.dart';

class BooksRepositoryImpl extends Booksrepository {
  final http.Client client;

  BooksRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, AllBooksResponse>> getAllBooks() async {
    try {
      var uri = Uri.parse(url);
      final response = await client.get(uri);

      String jsonDataString = response.body.toString();
      var jsonData = jsonDecode(jsonDataString);

      return Right(AllBooksResponse.fromJson(jsonData));
    } catch (e) {
      return Left(ServerFailure(""));
    }
  }
}
