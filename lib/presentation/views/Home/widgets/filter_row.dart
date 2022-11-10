import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../../../common_widgets/constants.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Constants.chooseLanguage(context,
                bottomSheetHeight: MediaQuery.of(context).size.height * 0.7);
          },
          child: Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: Constants.primaryIconBorderColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.language_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Text(
                  "EN",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Constants.primaryIconBorderColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: FaIcon(
                  FontAwesomeIcons.filter,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
