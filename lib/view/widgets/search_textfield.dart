import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield(
      {super.key,
      required this.preicon,
      required this.hinttext,
      required this.keyboard,
      this.controller,
     });
  final IconData preicon;
  final String hinttext;
  final TextInputType keyboard;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      controller: controller,
     
      keyboardType: keyboard,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: constants.white),
      decoration: InputDecoration(
        errorMaxLines: 3,
        contentPadding: const EdgeInsets.all(10),
        hintText: hinttext,
        hintStyle: styles.textfieldhintstyle,
        prefixIcon: Icon(
          preicon,
          color: constants.offwhite,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        fillColor: constants.fillcolor,
        filled: true,
      ),
    );
  }
}
