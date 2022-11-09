import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:coutnries_list/presentation/views/Details/details.dart';
import 'package:coutnries_list/presentation/views/Home/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // ignore: non_constant_identifier_names
  static Route<dynamic>? GenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/homePage":
        return MaterialPageRoute(builder: (_) {
          return HomePage();
        });
      case "/details":
        return MaterialPageRoute(builder: (_) {
          return DetailsPage(
            countriesList: args as CountriesList,
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Container(
            color: Colors.white,
            child: const Center(
                child: Text(
              "Error, Incorrect Route",
              textAlign: TextAlign.center,
            )),
          );
        });
    }
  }
}
