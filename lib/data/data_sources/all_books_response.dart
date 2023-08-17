import 'package:equatable/equatable.dart';

import '../../domain/entities/books_entity.dart';

// ignore: must_be_immutable
class AllBooksResponse extends Equatable {
  List<BooksModel>? books;

  AllBooksResponse({this.books});

  AllBooksResponse.fromJson(Map<String, dynamic> json) {
    if (json['data']['books'] != null) {
      books = <BooksModel>[];
      json['meals'].forEach((v) {
        books!.add(BooksModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (books != null) {
      data['meals'] = books!.map((v) => v.toEntity()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [books];
}

class BooksModel extends Equatable {
  const BooksModel({
    required this.id,
    required this.name,
    required this.publisher,
    required this.urlImage,
  });

  final String id;
  final String name;
  final String publisher;
  final String urlImage;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        id: json['name'],
        name: json['weather'][0]['main'],
        publisher: json['weather'][0]['description'],
        urlImage: json['weather'][0]['icon'],
      );

  BooksEntity toEntity() => BooksEntity(
        id: id,
        name: name,
        publisher: publisher,
        urlImage: urlImage,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        publisher,
        urlImage,
      ];
}
