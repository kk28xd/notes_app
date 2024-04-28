import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import '../constants.dart';
import 'colors_item&list_view.dart';

class EditColorNotesList extends StatefulWidget {
  const EditColorNotesList({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditColorNotesList> createState() => _EditColorNotesListState();
}

class _EditColorNotesListState extends State<EditColorNotesList> {
  late int Index;
  @override
  void initState() {
    Index = KColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: () {
              Index = index;
              widget.noteModel.color=KColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              isSelected: Index == index ? true : false,
              color: KColors[index],
            ),
          ),
        ),
        itemCount: KColors.length,
      ),
    );
  }
}