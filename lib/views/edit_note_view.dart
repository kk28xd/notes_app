import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/cutsom_app_bar.dart';
import '../widgets/edit_note_colors_list.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;
  TextEditingController? textEditingController = TextEditingController();
  TextEditingController? textEditingController2 = TextEditingController();

  @override
  void initState() {
    textEditingController2!.text = widget.note.title;
    textEditingController!.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Edit Note',
                    icon: Icons.check,
                    onPressed: () {
                      widget.note.title = title ?? widget.note.title;
                      widget.note.content = content ?? widget.note.content;
                      widget.note.save();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    textEditingController: textEditingController2,
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    maxLines: 5,
                    textEditingController: textEditingController,
                    onChanged: (val) {
                      content = val;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EditColorNotesList(noteModel: widget.note),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
