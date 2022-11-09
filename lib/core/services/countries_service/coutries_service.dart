import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../DataClass/countries_model.dart';

class CountriesService {
  CountriesService() {
    // initializeInterceptors();
  }
  Response<String>? response;
  final _dio = Dio(
    BaseOptions(
        headers: {"Accept": "application/json"},
        baseUrl: "https://restcountries.com/v3.1"),
  );

  Future<List<CountriesList>> getCountries() async {
    response = await _dio.get('/all',
        options: Options(responseType: ResponseType.json));

    // var coinList = CoinGeckoList();
    final countriesList = countriesListFromJson(response!.data.toString());
    var status = _dio.options.validateStatus;
    debugPrint("$status");
    return countriesList;
    // for (var element in countriesList) {
    //   debugPrint(element.name?.official);
    // }
  }

  void initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      debugPrint("The error is ${e.message}");
      return handler.next(e);
    }, onRequest: (request, handler) {
      return handler.next(request);
    }, onResponse: (response, handler) {
      // var status = response.statusCode;
      // debugPrint("$status");
      return handler.next(response);
    }));
  }
}
