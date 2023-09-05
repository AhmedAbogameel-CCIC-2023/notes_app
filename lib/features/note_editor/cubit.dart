import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/network_utils/network_utils.dart';

import '../../core/models/note.dart';
import '../../widgets/snack_bar.dart';

part 'states.dart';

class NoteEditorCubit extends Cubit<NoteEditorStates> {
  NoteEditorCubit() : super(NoteEditorInit());

  final formKey = GlobalKey<FormState>();

  TextEditingController titleTXController = TextEditingController();
  TextEditingController subtitleTXController = TextEditingController();

  bool validateInputs() {
    return formKey.currentState!.validate();
  }

  Future<Note?> addNote() async {
    emit(NoteEditorLoading());
    try {
      final response = await NetworkUtils.post(
        'note',
        data: {
          "title": titleTXController.text,
          "subtitle": subtitleTXController.text
        },
      );
      if (response.statusCode == 200) {
        showSnackBar("Note Added Successfully!");
        return Note.fromJson(response.data);
      } else {
        showSnackBar(response.data['message'], error: true);
      }
    } catch (e, s) {
      showSnackBar("Failed try again!", error: true);
      print(e);
      print(s);
    }
    emit(NoteEditorInit());
    return null;
  }

  Future<void> editNote() async {}

}