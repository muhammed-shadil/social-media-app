import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class CaptionTextfield extends StatelessWidget {
  const CaptionTextfield(
      {super.key,
      required this.hinttext,
      required this.keyboard,
      required this.validator,
      this.controller});
  final String hinttext;
  final TextInputType keyboard;
  final TextEditingController? controller;
  final String? Function(dynamic value) validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.88,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s')),
        ],
        controller: controller,
        validator: validator,
        keyboardType: keyboard,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: styles.textfieldhintstyle,
          filled: true,
          fillColor: constants.backgroundColor,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
