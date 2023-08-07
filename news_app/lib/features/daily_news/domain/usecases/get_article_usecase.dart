import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/entity/article.dart';

import '../../../../core/resources/data_states.dart';
import '../respository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(void params) {
    return _articleRepository.getArticles();
  }
}
