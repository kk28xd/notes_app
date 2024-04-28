import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
import '../constants.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/cutsom_app_bar.dart';
import '../widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              context: context,
              builder: (context) => const MyBottomSheet());
        },
        backgroundColor: KPrimaryColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: Color(0xff57EDD6))),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.search,
                title: 'Notes',
              ),
              Expanded(child: NotesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
