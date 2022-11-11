import 'package:coutnries_list/core/stateManagement/countries_state.dart';
import 'package:coutnries_list/presentation/common_widgets/custom_button.dart';
import 'package:coutnries_list/presentation/common_widgets/selectable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Constants {
  //!Colors
  static const Color primaryExplore = Color(0xFF001637);
  static const Color secondaryExplore = Color(0xFFFFFFFF);
  //
  static const Color primaryBackgroud = Colors.white;
  //
  static const Color primaryTextColor = Color(0xFF1C1917);
  static const Color secondaryTextColor = Color(0xFFF2F4F7);
  //
  static const Color primarySubTextColor = Color(0xFF667085);
  static const Color secondarySubTextColor = Color(0xFF98A2B3);
  //
  static const Color primaryGray1 = Color(0xFFF2F4F7);
  static const Color secondaryGray1 = Color(0x3398A2B3);
  //
  static const Color primaryIconColor = Colors.black;
  static const Color secondaryIconColor = Color(0xFFD0D5DD);
  //
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color secondaryBlack = Color(0xFF000F24);
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryIconBorderColor = Color(0xFFA9B8D4);

  //!Lists and Maps
  static const Map<String, String> translationToLanguage = {
    "eng": "English",
    "ara": "Arabic",
    "bre": "Breton",
    "ces": "Czech",
    "cym": "Welsh",
    "deu": "German",
    "est": "Estonian",
    "fin": "Finnish",
    "fra": "French",
    "hrv": "Croation",
    "hun": "Hungarian",
    "ita": "Italian",
    "jpn": "Japanese",
    "kor": "Korean",
    "nld": "Dutch",
    "per": "Persion",
    "pol": "Polish",
    "por": "Portuguese",
    "rus": "Russian",
    "slk": "Slovak",
    "spa": "Spanish",
    "swe": "Swedish",
    "tur": "Turkish",
    "urd": "Urdu",
    "zho": "Chinese",
  };

  //!FUNCTIONS
  static String groupValue = "eng";
  static bool isExpandedTimeZone = false, isExpandedRegion = false;

  static void filter(BuildContext context,
      {double? bottomSheetHeight, double? bottomSheetWidth}) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      )),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              // height: bottomSheetHeight,
              constraints: BoxConstraints(
                maxHeight: bottomSheetHeight!,
                maxWidth: bottomSheetWidth!,
                minHeight: 200,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  )),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.cancel,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      onExpansionChanged: (value) {
                        setState(() {
                          isExpandedRegion = !isExpandedRegion;
                        });
                      },
                      title: Text(
                        "Continent",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Icon(
                          isExpandedRegion
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 150,
                            maxHeight: bottomSheetHeight * 0.5,
                            maxWidth: bottomSheetWidth!,
                          ),
                          child: ListView.builder(
                            itemCount: context
                                .read<CountriesState>()
                                .selectableRegionList
                                .length,
                            itemBuilder: (context, index) {
                              var region = context
                                  .read<CountriesState>()
                                  .selectableRegionList[index];

                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: region.isSelected,
                                title: Text(
                                  region.data,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      region.isSelected = value!;
                                    },
                                  );
                                },
                                activeColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                checkColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      onExpansionChanged: (value) {
                        setState(() {
                          isExpandedTimeZone = !isExpandedTimeZone;
                        });
                      },
                      title: Text(
                        "Time Zone",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Icon(
                          isExpandedTimeZone
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 150,
                            maxHeight: bottomSheetHeight * 0.6,
                            maxWidth: bottomSheetWidth,
                          ),
                          child: ListView.builder(
                            itemCount: context
                                .read<CountriesState>()
                                .selectableTimeZoneList
                                .length,
                            itemBuilder: (context, index) {
                              var timeZone = context
                                  .read<CountriesState>()
                                  .selectableTimeZoneList[index];

                              return CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: timeZone.isSelected,
                                title: Text(
                                  timeZone.data,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(
                                    () {
                                      timeZone.isSelected = value!;
                                    },
                                  );
                                },
                                activeColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                checkColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            // color: Colors.amber,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    width: 1.0,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                onPressed: () {
                                  for (var timeZone in context
                                      .read<CountriesState>()
                                      .selectableTimeZoneList) {
                                    timeZone.isSelected = false;
                                  }
                                  for (var region in context
                                      .read<CountriesState>()
                                      .selectableRegionList) {
                                    region.isSelected = false;
                                  }
                                  context.read<CountriesState>().isFiltered =
                                      false;
                                  setState(
                                    () {},
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Reset",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                  ),
                                )),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 50,
                            // color: Colors.red,
                            child: CustomButton(
                              cornerRadius: 4,
                              text: "Show Results",
                              fontSize: 15,
                              textColor: Colors.white,
                              backgroundColor: Colors.orange,
                              onPressed: () {
                                if (context
                                        .read<CountriesState>()
                                        .selectableRegionList
                                        .isNotEmpty &&
                                    context
                                        .read<CountriesState>()
                                        .selectableRegionList
                                        .where((element) =>
                                            element.isSelected == true)
                                        .isNotEmpty) {
                                  context.read<CountriesState>().isFiltered =
                                      true;
                                  setState(
                                    () {},
                                  );
                                } else {
                                  context.read<CountriesState>().isFiltered =
                                      false;
                                }

                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void chooseLanguage(BuildContext context,
      {double? bottomSheetHeight}) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      )),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: bottomSheetHeight,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  )),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Languages",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.cancel,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: bottomSheetHeight! * 0.8,
                      child: ListView.builder(
                        itemCount: translationToLanguage.keys.length,
                        itemBuilder: (context, index) {
                          var item = translationToLanguage.keys.toList()[index];
                          var lang =
                              translationToLanguage.values.toList()[index];
                          return RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              lang,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            value: item,
                            groupValue: groupValue,
                            onChanged: (value) {
                              if (value == "eng") {
                                context
                                    .read<CountriesState>()
                                    .translationSelected = false;
                              } else {
                                context
                                    .read<CountriesState>()
                                    .translationSelected = true;
                              }
                              context.read<CountriesState>().translationString =
                                  value;
                              setState(() {
                                groupValue = value!;
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
