import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'notes_states.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());
  List<NoteModel>? note;
  String searchText = '';

  void updateSearchText(String text) {
    searchText = text;
    fetchAllNotes();
    emit(UpdateSearchSuccess());
  }

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(KNotesBox);
    note = notesBox.values.toList();
    if (searchText.isNotEmpty) {
      note = note!
          .where((item) =>
              item.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    emit(NoteSuccess());
  }
}
