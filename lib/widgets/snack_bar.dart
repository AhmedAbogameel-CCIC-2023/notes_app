import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String title,
  bool showDismissButton = false,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      action: showDismissButton ? SnackBarAction(
        onPressed: () {
          print('Dismiss');
        },
        textColor: Colors.yellow,
        label: "Dismiss",
      ) : null,
    ),
  );
}
