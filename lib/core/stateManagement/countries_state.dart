import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:flutter/material.dart';

import '../services/countries_service/coutries_service.dart';

class CountriesState with ChangeNotifier {
  List<CountriesList> _countriesList = [];

  List<CountriesList> get countriesList => _countriesList;

  Future<List<CountriesList>> fetchList() async {
    _countriesList = await CountriesService().getCountries();
    notifyListeners();
    return _countriesList;
  }

  // set countriesList(newValue) {
  //   _countriesList = newValue;
  //   notifyListeners();
  // }
}
