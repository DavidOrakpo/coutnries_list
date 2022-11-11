import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'connectivity_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (_shouldRetry(err)) {
      return requestRetrier.scheduleRequestRetry(err, handler);
    }
    switch (err.type) {
      case DioErrorType.receiveTimeout:
        print("The error is Receieve Timeout. Message is ${err.message}");
        return handler.next(err);

      case DioErrorType.connectTimeout:
        print("The error is connectTimeout. Message is ${err.message}");
        return handler.next(err);
      case DioErrorType.response:
        print("The error is response. Message is ${err.message}");
        return handler.next(err);
      case DioErrorType.cancel:
        print("The error is cancel. Message is ${err.message}");
        return handler.next(err);
      case DioErrorType.sendTimeout:
        print("The error is send. Message is ${err.message}");
        return handler.next(err);
      case DioErrorType.other:
        return handler.next(err);
    }

    // @override
    // Future onError(DioError err) async {
    //   if (_shouldRetry(err)) {
    //     return requestRetrier.scheduleRequestRetry(err, handler);
    //   }
    //   return super.onError(err, handler);

    // }
  }
}
