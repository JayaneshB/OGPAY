import 'package:flutter/material.dart';

extension SpacingExtension on List<Widget> {
  List<Widget> spaced(double height) {
    return expand((w) => [w, SizedBox(height: height)]).toList()..removeLast();
  }
}
