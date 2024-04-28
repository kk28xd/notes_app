import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'notes_states.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());
  List<NoteModel>? note;
  fetchAllNotes() {
    var NotesBox = Hive.box<NoteModel>(KNotesBox);
    note = NotesBox.values.toList();
    emit(NoteSuccess());
  }
}
