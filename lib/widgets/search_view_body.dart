import 'package:flutter/material.dart';
import 'package:notes_app/widgets/search_text_field.dart';

import 'notes_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 12,),
          SearchTextField(),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
