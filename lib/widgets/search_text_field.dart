import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black
      ),
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.search,color: Colors.black,),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(0),
        border: myBorder(),
        enabledBorder: myBorder(),
        focusedBorder: myBorder(),
      ),
      onChanged: (value) {
        BlocProvider.of<NotesCubit>(context).updateSearchText(value);
      },
    );
  }

  OutlineInputBorder myBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      gapPadding: 0,
    );
  }
}
