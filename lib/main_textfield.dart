import 'package:flutter/material.dart';

class MainTextfield extends StatelessWidget {
  const MainTextfield(
      {super.key,
      required this.preicon,
      required this.hinttext,
      required this.namefield});
  final IconData preicon;
  final String hinttext;
  final String namefield;
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
          SizedBox(
            height: 45,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: hinttext,
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
                prefixIcon: Icon(
                  preicon,
                  color: const Color.fromARGB(255, 255, 77, 103),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                fillColor: const Color.fromARGB(255, 47, 48, 55),
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
