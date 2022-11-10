import 'package:flutter/material.dart';

extension ListExtension<E> on List<E?> {
  void addAllUnique(Iterable<E?> iterable) {
    for (var element in iterable) {
      if (!contains(element)) {
        add(element);
      }
    }
  }
}

class MyScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
