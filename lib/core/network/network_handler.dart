import 'package:dio/dio.dart';

class NetworkHandler{
  static final NetworkHandler handler = NetworkHandler._internal();
  Dio dio = new Dio();

  factory NetworkHandler() => handler;

  NetworkHandler._internal();

  void init(String baseUrl){
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}