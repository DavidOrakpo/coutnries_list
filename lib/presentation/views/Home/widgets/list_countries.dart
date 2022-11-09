import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../core/services/DataClass/countries_model.dart';
import '../../../common_widgets/constants.dart';

class CountriesWidget extends StatefulWidget {
  CountriesWidget({Key? key, required this.countriesList}) : super(key: key);

  List<CountriesList>? countriesList;
  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  @override
  Widget build(BuildContext context) {
    return GroupedListView<CountriesList, String>(
      elements: widget.countriesList ?? [],
      groupBy: (coutnry) => (coutnry.name!.official)![0],
      itemBuilder: (context, country) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/details", arguments: country);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: NetworkImage(
                      country.flags!.png!,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(
              country.name!.common!,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text(
              (country.capital)!.firstWhere(
                (element) => element == element,
                orElse: () => "",
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
        );
      },
      groupSeparatorBuilder: (value) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        );
      },
    );
  }
}
