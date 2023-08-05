import 'package:equatable/equatable.dart';


// Define a class for an article entity that extends the Equatable class 

class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;


// used const constructor because it is a good practice to use const constructors for immutable objects to avoid unnecessary rebuilds

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });


// Override the props getter to return a list of all the fields as objects , it is used to compare two objects of the same type based on these fields
  @override
  List<Object?> get props => [
        id,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
