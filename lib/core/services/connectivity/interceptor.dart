import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'connectivity_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      return requestRetrier.scheduleRequestRetry(err, handler);
    }
    return super.onError(err, handler);
  }

  // @override
  // Future onError(DioError err) async {
  //   if (_shouldRetry(err)) {
  //     return requestRetrier.scheduleRequestRetry(err, handler);
  //   }
  //   return super.onError(err, handler);

  // }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
