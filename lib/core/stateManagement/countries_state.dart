import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:flutter/material.dart';

import '../../presentation/common_widgets/selectable.dart';
import '../services/countries_service/coutries_service.dart';

class CountriesState with ChangeNotifier {
  List<CountriesList> _countriesList = [];
  List<String> _listOfLanguages = [];
  List<String> _listOfTranslations = [];
  List<String> _listOfTimeZones = [];
  List<String> _listOfRegions = [];

  //! BOOLEAN CONTROLLING TRANSLATION
  bool _translationSelected = false;
  bool get translationSelected => _translationSelected;

  set translationSelected(value) {
    _translationSelected = value;
    notifyListeners();
  }

  //! BOOLEAN CONTROLLING FILTERING
  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;

  set isFiltered(value) {
    _isFiltered = value;
    notifyListeners();
  }

  //! String storing translation
  String _translationString = "eng";
  String get translationString => _translationString;

  set translationString(value) {
    _translationString = value;
    notifyListeners();
  }

  //!GET LISTS
  List<CountriesList> get countriesList => _countriesList;
  List<String> get listOfLanguages => _listOfLanguages;
  List<String> get listOfTranslations => _listOfTranslations;
  List<String> get listOfTimeZones => _listOfTimeZones;
  List<String> get listOfRegions => _listOfRegions;

  // List<ListItem<String>> get
  List<ListItem<String>> _selectableRegionList = [];
  List<ListItem<String>> get selectableRegionList => _selectableRegionList;

  void selectableRegionListMethod(value) {
    _selectableRegionList = _listOfRegions.map(
      (e) {
        return ListItem(e);
      },
    ).toList();
  }

  List<ListItem<String>> _selectableTimeZoneList = [];
  List<ListItem<String>> get selectableTimeZoneList => _selectableTimeZoneList;

  void selectableTimeZoneListMethod(value) {
    _selectableTimeZoneList = _listOfTimeZones.map(
      (e) {
        return ListItem(e);
      },
    ).toList();
  }

  Future<List<CountriesList>> fetchList() async {
    _countriesList = await CountriesService().getCountries();
    var future1 = CountriesService().getLanguages(_countriesList);
    var future2 = CountriesService().getTranslations(_countriesList);
    var future3 = CountriesService().getTimeZone(_countriesList);
    var future4 = CountriesService().getRegion(_countriesList);

    await Future.wait([
      future1.then((value) => _listOfLanguages = value),
      future2.then((value) => _listOfTranslations = value),
      future3.then((value) => _listOfTimeZones = value),
      future4.then((value) => _listOfRegions = value),
    ]);
    selectableRegionListMethod("value");
    selectableTimeZoneListMethod("value");

    notifyListeners();
    return _countriesList;
  }

  // set countriesList(newValue) {
  //   _countriesList = newValue;
  //   notifyListeners();
  // }
}
