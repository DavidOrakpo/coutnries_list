import 'package:coutnries_list/presentation/views/Home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/constants.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CoutriesSearchDelegate());
      },
      child: Container(
          height: 54,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Center(
                child: Text(
                  "Search Country",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
