import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hint, required this.maxLines,this.onSaved, this.onChanged, this.textEditingController});
  final String? hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onSaved: onSaved,
      validator: (val){
        if (val?.isEmpty ?? true){
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      maxLines: maxLines,
      cursorColor: KPrimaryColor,
      decoration: InputDecoration(

        hintText: hint,
        hintStyle: const TextStyle(color: KPrimaryColor),
        border: myBorder(),
        enabledBorder: myBorder(),
        focusedBorder: myBorder(KPrimaryColor),
        errorBorder: myBorder(Colors.red),
        errorStyle: const TextStyle(color: Colors.red)
      ),
    );
  }

  OutlineInputBorder myBorder([color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
  }
}
