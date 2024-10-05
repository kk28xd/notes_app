import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft
          ),
          onPressed: () {
            BlocProvider.of<NotesCubit>(context).updateSearchText('');
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notes',
          style: TextStyle(color: Color(0xffDCD9DE)),
        ),
        titleTextStyle: const TextStyle(fontSize: 28, fontFamily: 'Poppins'),
      ),
      body: const SearchViewBody(),
    );
  }
}
