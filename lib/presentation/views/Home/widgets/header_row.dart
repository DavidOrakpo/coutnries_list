import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/stateManagement/dark_theme_provider.dart';

class HeaderRow extends StatelessWidget {
  HeaderRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool? isDarkActive = context.read<DarkThemeProvider>().darkTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
              text: "Explore",
              style: GoogleFonts.amita(
                fontSize: 26,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ".",
              style: GoogleFonts.amita(
                fontSize: 36,
                color: const Color(0xFFFF6C00),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )),
        IconButton(
          onPressed: () {
            isDarkActive = !isDarkActive!;
            context.read<DarkThemeProvider>().darkTheme = isDarkActive!;
          },
          icon: isDarkActive
              ? Icon(
                  Icons.nightlight_round_sharp,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 30,
                )
              : Icon(
                  Icons.wb_sunny_outlined,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 30,
                ),
        ),
      ],
    );
  }
}
