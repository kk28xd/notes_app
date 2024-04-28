import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditNote(note: note,),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        width: double.infinity,
        //height: 200,
        child: Container(
          padding:
              const EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      note.content,
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5), fontSize: 18),
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    child: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 16),
                child: Text(
                  note.date,
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
