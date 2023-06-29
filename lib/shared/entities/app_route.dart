import 'package:flutter/material.dart';

mixin AppRoute {
  String get path;
  Widget get builder;

  /// Replaces all [path] segments starting with ":" with [replacements], from first to last.
  String buildLocation(List<String> replacements) {
    var index = 0;
    var newPath = path.replaceAllMapped(
      RegExp(':\\w+'),
      (match) {
        final segment = replacements[index];
        index++;
        return segment;
      },
    );
    return newPath;
  }
}
