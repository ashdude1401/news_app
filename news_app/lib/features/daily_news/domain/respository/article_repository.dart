// conatains the abstract class for article having all the methods and properties related to article 
import 'package:news_app/core/resources/data_states.dart';
import 'package:news_app/features/daily_news/domain/entity/article.dart';

abstract class ArticleRepository {

  // Define an abstract method to get the articles
  Future<DataState<List<ArticleEntity>>> getArticles();
}
