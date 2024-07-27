import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.buttontext, this.onpressed});
  final String buttontext;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: constants.secodarycolor,
        ),
        child: Text(buttontext, style: styles.mainbuttontext),
      ),
    );
  }
}
