import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:coutnries_list/core/stateManagement/countries_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/constants.dart';

class CoutriesSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle =>
      const TextStyle(color: Constants.primarySubTextColor);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      //! CLEARS THE SEARCH QUERY
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //!CLOSES THE APP BAR
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var listQuery = context.read<CountriesState>().countriesList;
    List<CountriesList> matchQuery = [];
    for (var country in listQuery) {
      if (country.name!.common!.toLowerCase().contains(query.toLowerCase()) ||
          country.name!.official!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/details", arguments: result);
          },
          child: ListTile(
            title: Text(
              result.name!.official ?? "",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var listQuery = context.read<CountriesState>().countriesList;
    List<CountriesList> matchQuery = [];
    for (var country in listQuery) {
      if (country.name!.common!.toLowerCase().contains(query.toLowerCase()) ||
          country.name!.official!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/details", arguments: result);
          },
          child: ListTile(
            title: Text(
              result.name!.common ?? "",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      },
    );
  }
}
