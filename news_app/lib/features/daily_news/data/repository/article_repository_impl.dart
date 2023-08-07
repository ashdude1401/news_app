import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constant.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service_impl.dart';

import '../../../../core/resources/data_states.dart';

import '../../domain/respository/article_repository.dart';
import '../modal/article_modal.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsAPIServiceImpl _newsAPIServiceImpl;
  ArticleRepositoryImpl(this._newsAPIServiceImpl);

  @override
  Future<DataState<List<ArticleModal>>> getArticles() async {
    try {
      final response = await _newsAPIServiceImpl.getRequest(
          endPoint: "top-headlines",
          queryParameters: {
            "apiKey": newsAPIKey,
            "country": "in",
            "category": "general"
          });

      if (response != null) {
        if (response.statusCode == 200) {
          final articles = response.data["articles"] as List;
          final articleList =
              articles.map((e) => ArticleModal.fromJson(e)).toList();
          return DataSuccess(articleList);
        } else {
          return DataFalied(DioError(
              requestOptions: response.requestOptions,
              response: response,
              type: DioErrorType.response,
              error: "Something went wrong"));
        }
      } else {
        return DataFalied(DioError(
            requestOptions: response!.requestOptions,
            response: response,
            type: DioErrorType.response,
            error: "Something went wrong"));
      }
    } on DioError catch (e) {
      return DataFalied(e);
    }
  }
}
