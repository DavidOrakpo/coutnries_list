import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/DataClass/countries_model.dart';
import '../../../../core/stateManagement/countries_state.dart';
import '../../../common_widgets/constants.dart';

class CountriesWidget extends StatefulWidget {
  CountriesWidget({Key? key, required this.countriesList}) : super(key: key);

  List<CountriesList>? countriesList;
  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  List<CountriesList> groupedCountriesList(BuildContext context) {
    var selectedRegionList = context
        .read<CountriesState>()
        .selectableRegionList
        .where(
          (element) => element.isSelected == true,
        )
        .map((e) => e.data)
        .toList();

    var selectedTimeZoneList = context
        .read<CountriesState>()
        .selectableTimeZoneList
        .where(
          (element) => element.isSelected == true,
        )
        .map((e) => e.data)
        .toList();
    //!FILTERED
    if ((context.watch<CountriesState>().isFiltered)) {
      //!BOTH FILTERED
      if (context.read<CountriesState>().isRegionFiltered &&
          context.read<CountriesState>().isTimeZoneFiltered) {
        return widget.countriesList!
            .where((country) => (selectedRegionList.contains(country.region) &&
                country.timezones!.toSet().containsAll(selectedTimeZoneList)))
            .toList();
      } else {
        //!REGION FILTERED ONLY
        if (context.read<CountriesState>().isRegionFiltered &&
            !context.read<CountriesState>().isTimeZoneFiltered) {
          return widget.countriesList!
              .where((country) => selectedRegionList.contains(country.region))
              .toList();
        }
        //!TIME ZONE FILTERED ONLY
        else if (!context.read<CountriesState>().isRegionFiltered &&
            context.read<CountriesState>().isTimeZoneFiltered) {
          return widget.countriesList!
              .where((country) =>
                  selectedTimeZoneList.toSet().containsAll(country.timezones!))
              .toList();
        } else {
          return widget.countriesList!
              .where((country) =>
                  country.timezones!.toSet().containsAll(selectedTimeZoneList))
              .toList();
        }
      }
    } else {
      //!NOT FILTERED
      return widget.countriesList!;
    }
  }

  @override
  Widget build(BuildContext context) {
    String groupBy(CountriesList country) {
      // var selectedRegionList = context
      //     .read<CountriesState>()
      //     .selectableRegionList
      //     .where(
      //       (element) => element.isSelected == true,
      //     )
      //     .map((e) => e.data)
      //     .toList();

      // var selectedTimeZoneList = context
      //     .read<CountriesState>()
      //     .selectableTimeZoneList
      //     .where(
      //       (element) => element.isSelected == true,
      //     )
      //     .map((e) => e.data)
      //     .toList();
      //!FILTERED
      if ((context.watch<CountriesState>().isFiltered)) {
        //!BOTH FILTERED
        if (context.read<CountriesState>().isRegionFiltered &&
            context.read<CountriesState>().isTimeZoneFiltered) {
          return "${country.region} ${country.timezones!.first}";
        } else {
          //!REGION FILTERED ONLY
          if (context.read<CountriesState>().isRegionFiltered &&
              !context.read<CountriesState>().isTimeZoneFiltered) {
            return "${country.region}";
          } else if (!context.read<CountriesState>().isRegionFiltered &&
              context.read<CountriesState>().isTimeZoneFiltered) {
            return country.timezones!.first;
          } else {
            return country.timezones!.first;
          }
        }
      } else {
        //!NOT FILTERED
        return (context.watch<CountriesState>().translationSelected)
            ? (country.translations![
                        context.read<CountriesState>().translationString] ==
                    null)
                ? country.name!.common![0]
                : country
                    .translations![
                        context.read<CountriesState>().translationString]!
                    .common![0]
            : country.name!.common![0];
      }
    }

    // var selectedRegionList = context
    //     .read<CountriesState>()
    //     .selectableRegionList
    //     .where(
    //       (element) => element.isSelected == true,
    //     )
    //     .map((e) => e.data)
    //     .toList();
    return GroupedListView<CountriesList, String>(
      elements: groupedCountriesList(context),
      groupBy: groupBy,
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
              (context.watch<CountriesState>().isFiltered)
                  //!TEXT IS FILTERED

                  ? (context.watch<CountriesState>().translationSelected &&
                          context
                              .read<CountriesState>()
                              .selectableRegionList
                              .where(
                                (element) => element.isSelected == true,
                              )
                              .map((e) => e.data)
                              .toList()
                              .contains(country.region))
                      //!TEXT IS FILTERED AND TRANSLATED
                      ? country
                          .translations![
                              context.read<CountriesState>().translationString]!
                          .common!
                      //!TEXT IS FILTERED AND NOT TRANSLATED
                      : country.name!.common!
                  //!TEXT IS NOT FILTERED
                  : (context.watch<CountriesState>().translationSelected)
                      ? country
                          .translations![
                              context.read<CountriesState>().translationString]!
                          .common!
                      : country.name!.common!,
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
