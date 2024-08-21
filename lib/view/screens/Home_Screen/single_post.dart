import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({super.key});

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  bool isSwapped = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.78,
      width: screenWidth * 0.9,
      child: Stack(
        children: [
          // Large Image (conditionally behind or in front based on isSwapped)
          if (!isSwapped) buildLargeImage(screenWidth, screenHeight),
          buildSmallImage(screenWidth, screenHeight),
          if (isSwapped) buildLargeImage(screenWidth, screenHeight),

          // Text and Avatar (unchanged)
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
        ],
      ),
    );
  }

  Widget buildLargeImage(double screenWidth, double screenHeight) {
    return AnimatedPositioned(
      top: isSwapped ? 5 : 70,
      left: isSwapped ? 5 : 0,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: isSwapped
            ? () {
                // Handle tap on small image when it's smaller
                setState(() {
                  isSwapped = !isSwapped;
                });
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isSwapped ? 90 : screenWidth * 0.9,
          height: isSwapped ? 120 : screenHeight * 0.6,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                "assets/b64ac4c65983e8702efcc1024bf6b142-e1505106508525.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: isSwapped
                ? const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )
                : BorderRadius.circular(30),
            border: Border.all(
              width: isSwapped ? 5 : 0,
              color: isSwapped ? constants.backgroundColor : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSmallImage(double screenWidth, double screenHeight) {
    return AnimatedPositioned(
      top: isSwapped ? 70 : 5,
      left: isSwapped ? 0 : 5,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: isSwapped
            ? null
            : () {
                // Handle tap on small image when it's smaller
                setState(() {
                  isSwapped = !isSwapped;
                });
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isSwapped ? screenWidth * 0.9 : 90,
          height: isSwapped ? screenHeight * 0.6 : 120,
          decoration: BoxDecoration(
            border: isSwapped
                ? Border.all(width: 0, color: Colors.transparent)
                : Border.all(width: 5, color: constants.backgroundColor),
            image: const DecorationImage(
              image: AssetImage(
                "assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: isSwapped
                ? BorderRadius.circular(30)
                : const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
          ),
        ),
      ),
    );
  }
}
