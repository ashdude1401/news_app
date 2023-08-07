import 'package:news_app/features/daily_news/domain/entity/article.dart';

class ArticleModal extends ArticleEntity {
  const ArticleModal({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  // Define a factory constructor to convert a json object to an ArticleModal object
  factory ArticleModal.fromJson(Map<String, dynamic> data) {
    return ArticleModal(
      id: data['id']??"",
      author: data['author']??"",
      title: data['title']??"",
      description: data['description']??"",
      url: data['url']??"",
      urlToImage: data['urlToImage']??"",
      publishedAt: data['publishedAt']??"",
      content: data['content']??"",
    );
  }
}

/*Note*/
// We are using Article Modal instead of using Article Entity directly because in clean architectre we have to use the entity class in the domain layer only and not in the data layer so we have to create a modal class in the data layer which will be used to convert the json object to the modal object and then we will convert the modal object to the entity object in the domain layer and then we will use the entity object in the presentation layer.

//by doing so , even if the data sources changes and we have to change the modal class then we will only have to change the modal class in the data layer and not in the domain layer and the presentation layer.
