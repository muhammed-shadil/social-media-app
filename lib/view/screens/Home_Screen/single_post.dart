import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class SinglePost extends StatelessWidget {
  const SinglePost({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Victor Daniel",
                    style: styles.usernamefont,
                  ),
                  Text(
                    "Agra, New Delhi",
                    style: styles.postlocation,
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"),
              )
            ],
          ),
          Positioned(
              top: 70,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/b64ac4c65983e8702efcc1024bf6b142-e1505106508525.jpg",
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
              )),
          Positioned(
              top: 5,
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 5, color: constants.backgroundColor),
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg")),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                width: 90,
                height: 120,
              )),
        ],
      ),
    );
  }
}
