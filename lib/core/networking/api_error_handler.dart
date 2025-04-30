import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ApiErrorHandler {
  static String handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return tr('check_internet');
        case DioExceptionType.cancel:
          return tr('cancel_request');
        case DioExceptionType.connectionTimeout:
          return tr('connectionTimeout');
        case DioExceptionType.unknown:
          return tr('check_internet');
        case DioExceptionType.receiveTimeout:
          return tr('receiveTimeout');

        case DioExceptionType.sendTimeout:
          return tr('sendTimeout');
        default:
          return tr('server_error');
      }
    } else {
      return tr('server_error');
    }
  }
}