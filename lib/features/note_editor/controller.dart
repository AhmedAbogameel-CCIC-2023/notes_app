import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/note.dart';

class NoteEditorController {
  final formKey = GlobalKey<FormState>();

  String? title;
  String? subtitle;

  Future<Note?> addNote() async {
    if (!formKey.currentState!.validate()) {
      return null;
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
    return Note(
      title: title!,
      id: id,
      subtitle: subtitle!,
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