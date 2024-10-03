import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class shimmer_home extends StatelessWidget {
  const shimmer_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: constants.shimmerBase,
                        highlightColor: constants.shimmerhighlite,
                        child: Container(
                          decoration: BoxDecoration(
                              color: constants.offwhite,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Victor Daniel",
                            style: styles.usernamefont,
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                          baseColor: constants.shimmerBase,
                          highlightColor: constants.shimmerhighlite,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: constants.offwhite,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text("Agra, New Delhi"))),
                    ],
                  ),
                  Shimmer.fromColors(
                    baseColor: constants.shimmerBase,
                    highlightColor: constants.shimmerhighlite,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: 70,
                  child: Shimmer.fromColors(
                    baseColor: constants.shimmerBase,
                    highlightColor: constants.shimmerhighlite,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/b64ac4c65983e8702efcc1024bf6b142-e1505106508525.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 236, 234, 227),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                    ),
                  )),
              Positioned(
                  top: 5,
                  child: Shimmer.fromColors(
                    baseColor: constants.shimmerBase,
                    highlightColor: constants.shimmerhighlite,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 5, color: constants.backgroundColor),
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg")),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                        color: constants.offwhite,
                      ),
                      width: 90,
                      height: 120,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
