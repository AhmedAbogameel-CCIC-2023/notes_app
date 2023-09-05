import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/caching_utils/caching_utils.dart';
import 'package:note_app/core/network_utils/network_utils.dart';
import 'package:note_app/features/home/states.dart';

import '../../core/models/note.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  List<Note> notes = [];

  Future<void> getNotes() async {
    notes.clear();
    emit(HomeLoading());
    try {
      final response = await NetworkUtils.get('note?page=1');
      for (var i in response.data['notes']) {
        notes.add(Note.fromJson(i));
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(HomeInit());
  }

  void insertNote(Note note) {
    notes.insert(0, note);
    emit(HomeInit());
  }

}
