import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NoteState>(builder: (context, state) {
      List<NoteModel> note = BlocProvider.of<NotesCubit>(context).note ?? [];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.only(top: 12),
            child: CustomNoteItem(
              note: note[i],
            ),
          ),
          itemCount: note.length,
        ),
      );
    });
  }
}
