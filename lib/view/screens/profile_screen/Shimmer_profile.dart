import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_button.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: constants.shimmerBase,
            highlightColor: constants.shimmerhighlite,
            child: Container(
              color: constants.offwhite,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 31, 32, 38),
            highlightColor: const Color.fromARGB(255, 54, 55, 61),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Welcome to my profile",
                style: styles.bio,
              ),
            ),
          ),
          Center(
            child: Shimmer.fromColors(
              baseColor: constants.shimmerBase,
              highlightColor: constants.shimmerhighlite,
              child: MainButton(
                child: const Text(
                  "Follow",
                  style: styles.mainbuttontext,
                ),
                onpressed: () {
                  // Implement Follow/Unfollow logic
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Shimmer.fromColors(
                  baseColor: constants.shimmerBase,
                  highlightColor: constants.shimmerhighlite,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: constants.blackOP2,
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
