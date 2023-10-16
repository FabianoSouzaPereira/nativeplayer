import 'package:dio/dio.dart';
import 'package:nativeplayer/core/http/abstract_http_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHttpClient extends AbstractHttpClient {
  final Dio dio;

  DioHttpClient({
    required this.dio,
  });

  Dio get _instance {
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    // dio.interceptors.add(AuthDioInterceptor(localAuthRepository: localAuthRepository));

    //dio.interceptors.add(CurlLoggerDioInterceptor());

    return dio;
  }

  @override
  Future<HttpResponse<T>> delete<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> download<T>(String url, String path) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> post<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse<T>> put<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
