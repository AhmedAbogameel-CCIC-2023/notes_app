import 'package:flutter/material.dart';

class RouteUtils {
  static void push({
    required BuildContext context,
    required Widget view,
  }) {
    Navigator.of(context).push(
      _getRoute(view),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void pushReplacement({
    required BuildContext context,
    required Widget view,
  }) {
    Navigator.of(context).pushReplacement(
      _getRoute(view),
    );
  }

  static void pushAndPopAll({
    required BuildContext context,
    required Widget view,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
      _getRoute(view),
      (route) => false,
    );
  }

  static Route _getRoute(Widget view) {
    return MaterialPageRoute(
      builder: (context) => view,
    );
  }

}
