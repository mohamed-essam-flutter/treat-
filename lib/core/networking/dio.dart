import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:treat/core/networking/api_constant.dart';
import 'package:treat/core/utils/api_error_handler.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class DioHelper {
  static final instance = DioHelper._();
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Connection.apiURL,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Apipassword': Connection.apiPassword,
      },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  //Singleton
  DioHelper._() {
    // Attach Logger
    if (kDebugMode) {
      dio.interceptors.add(_logger);
      dio.interceptors.add(ChuckerDioInterceptor());
    }
  }

  // Logger
  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  Future<Response> getData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    try {
      return await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: {
            if (token != null) 'Authorization': token,
            'locale': AppConstants.LANGUAGE,
          },
        ),
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        return error.response!;
      }
      return Response(data: {
        'message': ApiErrorHandler.handle(error),
      }, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> postData(
    String url, {
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> body,
    FormData? multiPartBody,
  }) async {
    try {
      return await dio.post(
        url,
        queryParameters: query,
        data: multiPartBody ?? body,
        options: Options(
          headers: {
            if (token != null) 'Authorization': token,
            'locale': AppConstants.LANGUAGE,
          },
        ),
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        return error.response!;
      }
      return Response(data: {
        'message': ApiErrorHandler.handle(error),
      }, requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return dio.put(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        return error.response!;
      }
      return Response(data: {
        'message': ApiErrorHandler.handle(error),
      }, requestOptions: RequestOptions(path: ''));
    }
  }
}

// class MoyasarDioHelper {
//   static final instance = MoyasarDioHelper._();

//   static Dio dio = Dio(
//     BaseOptions(
//       baseUrl: ApiNames.moyasarApiURL,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'publish_key': publishKey,
//         'Authorization': 'Basic $secretKey',
//       },
//       receiveDataWhenStatusError: true,
//     ),
//   );

//   //Singleton
//   MoyasarDioHelper._() {
//     // Attach Logger
//     if (kDebugMode) dio.interceptors.add(_logger);
//   }

//   // Logger
//   static final PrettyDioLogger _logger = PrettyDioLogger(
//     requestBody: true,
//     responseBody: true,
//     requestHeader: true,
//     error: true,
//   );

//   Future<Response> getData(String url, {Map<String, dynamic>? query}) async {
//     try {
//       return await dio.get(
//         url,
//         queryParameters: query,
//         options: Options(
//           headers: {
//             'locale': AppConstants.LANGUAGE,
//           },
//         ),
//       );
//     } on DioException catch (e) {
//       if (e.type == DioExceptionType.unknown ||
//           e.type == DioExceptionType.connectionTimeout) {
//         return Response(data: {
//           'message': tr('check_internet'),
//         }, requestOptions: RequestOptions(path: ''));
//       }
//       return e.response!;
//     }
//   }

//   Future<Response> postData(
//     String url, {
//     Map<String, dynamic>? query,
//     required Map<String, dynamic> body,
//     FormData? multiPartBody,
//   }) async {
//     try {
//       return await dio.post(
//         url,
//         queryParameters: query,
//         data: multiPartBody ?? body,
//       );
//     } on DioException catch (e) {
//       if (e.type == DioExceptionType.unknown ||
//           e.type == DioExceptionType.connectionTimeout) {
//         return Response(data: {
//           'message': tr('check_internet'),
//         }, requestOptions: RequestOptions(path: ''));
//       }
//       return e.response!;
//     }
//   }
// }