import 'package:nativeplayer/ui/helpers/http_helper.dart';

class ResponseData<T> {
  T? data;
  bool success;
  ResultStatusCode? statusCode;
  String? errorMessage;

  ResponseData({this.data, required this.success, this.statusCode, this.errorMessage});
}
