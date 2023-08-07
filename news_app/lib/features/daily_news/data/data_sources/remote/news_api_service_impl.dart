import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/features/daily_news/data/modal/article_modal.dart';

import '../../../../../core/constants/constant.dart';
import 'news_api_service.dart';

class NewsAPIServiceImpl implements NewsAPIService {
  // Define a private static instance of the NewsAPIServiceImpl class

  // dio instance to make the request
  static Dio? _dio;

  // cancel token to cancel the request
  static CancelToken? _cancelRequestToken;

  //instance of the NewsAPIServiceImpl class
  static NewsAPIServiceImpl? _instance;

  //connect timeout for the request for 20 seconds , if the request is not completed in 20 seconds then it will throw an error
  static int connectTimeout = 20000;

  //receive timeout for the request for 6 seconds , if the response is not received in 6 seconds then it will throw an error
  static int receiveTimeout = 6000;

  // Define a private constructor Singleton class so that only one instance of the class can be created
  NewsAPIServiceImpl._createInstance();

  factory NewsAPIServiceImpl() {
    _instance ??= NewsAPIServiceImpl._createInstance();
    return _instance!;
  }

  @override
  Future<Response?> getRequest(
      {String baseUrl = newsAPIBaseURL,
      required String endPoint,
      Map<String, dynamic>? queryParameters}) async {
    // Define a variable to store the response
    Response? response;

    //check if the device is connected to the internet or not
    if (await InternetConnectionChecker().hasConnection) {
      try {
        //set the connect timeout and receive timeout for the request
        _dio?.options.connectTimeout = connectTimeout;

        _dio?.options.receiveTimeout = receiveTimeout;

        //make the request

        //get the response using the get method of the dio package
        response = await _dio?.get(baseUrl + endPoint,
            queryParameters: queryParameters,
            cancelToken: _cancelRequestToken,
            options: Options(headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }));
      } on DioError catch (e) {
        log("Dio Error: ${e.message}");
      }
    } else {
      log("No Internet Connection");
    }
    print(response?.data);
    return response;
  }
}
