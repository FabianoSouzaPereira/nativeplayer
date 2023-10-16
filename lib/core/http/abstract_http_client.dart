abstract class AbstractHttpClient {
  String baseUrl = "";

  Future<HttpResponse<T>> post<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters});

  Future<HttpResponse<T>> put<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters});

  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters});

  Future<HttpResponse<T>> delete<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters});

  Future<HttpResponse<T>> download<T>(String url, String path);
}

class HttpResponse<T> {
  HttpResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  T? data;
  int? statusCode;
  String? statusMessage;
}
