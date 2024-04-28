import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.label, this.on, required this.isLoading});

  final String label;
  final void Function()? on;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: on,
      color: KPrimaryColor,
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      child: isLoading
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
              ))
          : Text(label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
    );
  }
}
