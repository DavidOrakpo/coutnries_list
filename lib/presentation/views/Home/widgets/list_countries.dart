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
  @override
  Widget build(BuildContext context) {
    var isSelectedRegion = context
        .read<CountriesState>()
        .selectableRegionList
        .where(
          (element) => element.isSelected == true,
        )
        .map((e) => e.data)
        .toList();
    return GroupedListView<CountriesList, String>(
      elements: (context.watch<CountriesState>().isFiltered)
          ? widget.countriesList!
              .where((element) => isSelectedRegion.contains(element.region))
              .toList()
          : widget.countriesList!,
      groupBy: (context.watch<CountriesState>().isFiltered)
          //!IS FIltered
          ? (coutnry) {
              var isSelectedRegion = context
                  .read<CountriesState>()
                  .selectableRegionList
                  .where(
                    (element) => element.isSelected == true,
                  )
                  .map((e) => e.data)
                  .toList();
              return (context.watch<CountriesState>().translationSelected &&
                      isSelectedRegion.contains(coutnry.region))
                  //!IS FILTERED AND TRANSLATED
                  ? coutnry.region!
                  //!IS FILTERED AND NOT TRANSLATED
                  : coutnry.region!;
            }
          //! IS NOT FILTERED
          : (coutnry) {
              return (context.watch<CountriesState>().translationSelected)
                  ? (coutnry.translations![context
                              .read<CountriesState>()
                              .translationString] ==
                          null)
                      ? coutnry.name!.common![0]
                      : coutnry
                          .translations![
                              context.read<CountriesState>().translationString]!
                          .common![0]
                  : coutnry.name!.common![0];
            },
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
