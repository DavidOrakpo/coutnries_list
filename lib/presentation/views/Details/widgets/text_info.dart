import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextInfo extends StatelessWidget {
  TextInfo({
    Key? key,
    // required this.description,
    required this.title,
    required this.value,
    required this.formatter,
  }) : super(key: key);
  String? title;
  NumberFormat? formatter;
  Object? value;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary),
        ),
        TextSpan(
          text: (value is String)
              ? value.toString()
              : formatter!.format(int.parse(value.toString())),
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.tertiary),
        ),
      ],
    ));
  }
}
