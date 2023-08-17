import 'package:flutter/material.dart';

import '../../core/models/note.dart';

class HomeController {
  List<Note> notes = [
    Note(
      id: "1",
      title: 'title1',
      subtitle: 'subtitle1',
    ),
    Note(
      id: "2",
      title: 'title2',
      subtitle: 'subtitle2',
    ),
  ];
}
