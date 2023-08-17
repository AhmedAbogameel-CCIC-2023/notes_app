import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteEditorController {
  final formKey = GlobalKey<FormState>();

  String? title;
  String? subtitle;

  Future<void> addNote() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    List<String> cachedNotes = prefs.getStringList('notes') ?? [];
    cachedNotes.insert(
      0,
      jsonEncode({
        'title': title,
        'subtitle': subtitle,
        "id": id,
      }),
    );
    await prefs.setStringList(
      'notes',
      cachedNotes,
    );
  }
}

/*
SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    prefs.setString(
      id,
      jsonEncode({
        'title': title,
        'subtitle': subtitle,
        "id": id,
      }),
    );
    for (String i in prefs.getKeys()) {
      print(prefs.getString(i));
    }
 */

// List<String> cachedNotes = prefs.getStringList('notes') ?? [];
// cachedNotes.insert(
//   0,
//   jsonEncode({
//     'title': title,
//     'subtitle': subtitle,
//     "id": 12,
//   }),
// );
// prefs.setStringList(
//   'notes',
//   cachedNotes,
// );