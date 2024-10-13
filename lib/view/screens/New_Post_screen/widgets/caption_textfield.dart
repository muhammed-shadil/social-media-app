import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width *
                0.1, // Set your desired minimum width
            maxWidth: MediaQuery.of(context).size.width *
                0.4, // Maximum width as 90% of parent width
          ),
          child: IntrinsicWidth(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'\s')), // No spaces allowed
              ],
              controller: controller,
              validator: validator,
              keyboardType: keyboard,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: TextAlign.right, // Align text and hint to the right
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: styles.textfieldhintstyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
