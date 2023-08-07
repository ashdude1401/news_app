//this class handles all the calls realted to news api

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constant.dart';

abstract class NewsAPIService {

  // Define an abstract method to get the articles
  Future<Response?> getRequest({
    String baseUrl = newsAPIBaseURL,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });
}

