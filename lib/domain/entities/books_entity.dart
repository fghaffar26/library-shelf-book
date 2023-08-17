import 'package:equatable/equatable.dart';

class BooksEntity extends Equatable {
  const BooksEntity({
    required this.id,
    required this.name,
    required this.publisher,
    required this.urlImage,
  });

  final String id;
  final String name;
  final String publisher;
  final String urlImage;

  @override
  List<Object?> get props => [
        id,
        name,
        publisher,
        urlImage,
      ];
}
