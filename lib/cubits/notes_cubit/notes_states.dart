import '../../models/note_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteSuccess extends NoteState {}

class UpdateSearchSuccess extends NoteState{}


