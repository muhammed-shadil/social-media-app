import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class MainTextfield extends StatelessWidget {
  MainTextfield(
      {super.key,
      this.preicon,
      required this.hinttext,
      required this.namefield,
      required this.keyboard,
      required this.validator,
      this.controller,
      this.maxlines,
      this.space = false});
  final IconData? preicon;
  final String hinttext;
  final String namefield;
  final TextInputType keyboard;
  final int? maxlines;
  final TextEditingController? controller;
  final String? Function(dynamic value) validator;
  final bool space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(namefield),
          ),
          TextFormField(
            maxLines: maxlines,
            textInputAction: TextInputAction.next,
            inputFormatters: space == true
                ? []
                : [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
            controller: controller,
            validator: validator,
            keyboardType: keyboard,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(color: constants.white),
            decoration: InputDecoration(
              errorMaxLines: 3,
              contentPadding: const EdgeInsets.all(10),
              hintText: hinttext,
              hintStyle: styles.textfieldhintstyle,
              prefixIcon: preicon == null
                  ? null
                  : Icon(
                      preicon,
                      color: constants.secodarycolor,
                    ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: constants.fillcolor,
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
