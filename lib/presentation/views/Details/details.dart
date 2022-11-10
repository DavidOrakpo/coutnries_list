import 'package:coutnries_list/core/services/DataClass/countries_model.dart';
import 'package:coutnries_list/presentation/views/Details/widgets/image_card.dart';
import 'package:coutnries_list/presentation/views/Details/widgets/text_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common_widgets/constants.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.countriesList}) : super(key: key);
  CountriesList countriesList;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var formatter = NumberFormat('#,###,000');
  var controller = PageController();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            (widget.countriesList.name?.common)!,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageCard(countriesList: widget.countriesList),
                const SizedBox(
                  height: 24,
                ),
                TextInfo(
                    title: "Population: ",
                    value: widget.countriesList.population,
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Region: ",
                    value: widget.countriesList.region,
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Capital: ",
                    value: (widget.countriesList.capital)!.firstWhere(
                      (element) => element == element,
                      orElse: () => "No Capital",
                    ),
                    formatter: formatter),
                const SizedBox(
                  height: 30,
                ),

                TextInfo(
                    title: "Official languages: ",
                    value: widget.countriesList.languages
                        ?.getLanguages()
                        .where((element) => element != null)
                        .firstWhere(
                          (element) => (element == element),
                          orElse: () => "English",
                        ),
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Region: ",
                    value: widget.countriesList.region,
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Sub Region: ",
                    value: widget.countriesList.subregion,
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Continent: ",
                    value: widget.countriesList.continents?.first,
                    formatter: formatter),
                const SizedBox(
                  height: 30,
                ),
                TextInfo(
                    title: "Independent: ",
                    value: (widget.countriesList.independent)! ? "Yes" : "No",
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Area: ",
                    value: "${widget.countriesList.area.toString()} km2",
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "UN-Member: ",
                    value: (widget.countriesList.unMember)! ? "Yes" : "No",
                    formatter: formatter),
                const SizedBox(
                  height: 30,
                ),
                TextInfo(
                    title: "Time Zone:  ",
                    value: widget.countriesList.timezones?.first,
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Date format:  ",
                    value: "dd/mm/yyyy",
                    formatter: formatter),
                const SizedBox(
                  height: 10,
                ),
                TextInfo(
                    title: "Driving Side:  ",
                    value: widget.countriesList.car?.side?.toUpperCase(),
                    formatter: formatter)

                // TextInfo(
                //     title: "Motto: ",
                //     value: widget.countriesList.,
                //     formatter: formatter),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
