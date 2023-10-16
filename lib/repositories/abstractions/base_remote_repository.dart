import 'package:dio/dio.dart';
import 'package:nativeplayer/core/http/abstract_http_client.dart';
import 'package:nativeplayer/repositories/abstractions/response_data.dart';
import 'package:nativeplayer/ui/helpers/http_helper.dart';

abstract class BaseRemoteRepository {
  late AbstractHttpClient httpClient;

  BaseRemoteRepository(this.httpClient);

  Future<ResponseData<T>> getResponseDataForException<T>(Exception exception,
      {ResultStatusCode? statusCode, String? errorMessage}) async {
    return ResponseData<T>(
        data: null, success: false, statusCode: statusCode, errorMessage: errorMessage ?? exception.toString());
  }

  Future<ResponseData<T>> executeCall<T>(Function() code) async {
    try {
      return await code();
    } on DioError catch (dioException) {
      return getResponseDataForException(
        dioException,
        statusCode: getResultStatusCode(dioException.response?.statusCode),
        errorMessage: dioException.response?.data["message"],
      );
    } on Exception catch (exception) {
      return getResponseDataForException(exception);
    }
  }

  // String get baseUrlPublic => FlavorConfig.instance.urlBasePublic;

  // String get baseUrl => FlavorConfig.instance.urlBase;

  // String get exporterUrl => FlavorConfig.instance.urlExporter;

  ResultStatusCode getResultStatusCode(int? httpStatusCode) {
    switch (httpStatusCode) {
      case 200:
      case 201:
      case 202:
        return ResultStatusCode.ok;
      case 400:
        return ResultStatusCode.badRequest;
      case 401:
      case 403:
        return ResultStatusCode.unauthorized;
      case 404:
        return ResultStatusCode.notFound;
      case 408:
        return ResultStatusCode.timeout;
      case 500:
        return ResultStatusCode.internalServerError;
      default:
        return ResultStatusCode.unknow;
    }
  }
}
