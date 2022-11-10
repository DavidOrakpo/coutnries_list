import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:flutter/material.dart';

import '../services/countries_service/coutries_service.dart';

class CountriesState with ChangeNotifier {
  List<CountriesList> _countriesList = [];
  List<String> _listOfLanguages = [];
  List<String> _listOfTranslations = [];

  //! BOOLEAN CONTROLLING TRANSLATION
  bool _translationSelected = false;
  bool get translationSelected => _translationSelected;

  set translationSelected(value) {
    _translationSelected = value;
    notifyListeners();
  }

  String _translationString = "eng";
  String get translationString => _translationString;

  set translationString(value) {
    _translationString = value;
    notifyListeners();
  }

  List<CountriesList> get countriesList => _countriesList;
  List<String> get listOfLanguages => _listOfLanguages;
  List<String> get listOfTranslations => _listOfTranslations;

  Future<List<CountriesList>> fetchList() async {
    _countriesList = await CountriesService().getCountries();
    var future1 = CountriesService().getLanguages(_countriesList);
    var future2 = CountriesService().getTranslations(_countriesList);
    await Future.wait([
      future1.then((value) => _listOfLanguages = value),
      future2.then((value) => _listOfTranslations = value),
    ]);
    notifyListeners();
    return _countriesList;
  }

  // set countriesList(newValue) {
  //   _countriesList = newValue;
  //   notifyListeners();
  // }
}
