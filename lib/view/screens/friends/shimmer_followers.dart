import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek/utils/constants.dart';

class ShimmerFollowers extends StatelessWidget {
  const ShimmerFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: constants.fillcolor,
                leading: Shimmer.fromColors(
                  baseColor: constants.shimmerBase,
                  highlightColor: constants.shimmerhighlite,
                  child: const CircleAvatar(
                    backgroundColor: constants.offwhite,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                  ),
                ),
                title: Shimmer.fromColors(
                    baseColor: constants.shimmerBase,
                    highlightColor: constants.shimmerhighlite,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: constants.offwhite,
                        ),
                        child: const Text("name"))),
                subtitle: Shimmer.fromColors(
                    baseColor: constants.shimmerBase,
                    highlightColor: constants.shimmerhighlite,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: constants.offwhite,
                        ),
                        child: const Text("username"))),
                trailing: Shimmer.fromColors(
                  baseColor: constants.shimmerBase,
                  highlightColor: constants.shimmerhighlite,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: constants.backgroundColor,
                    ),
                    child: Image.asset("assets/chat-conversation.png"),
                  ),
                ),
              )),
          separatorBuilder: (context, index) => constants.height10,
          itemCount: 10),
    );
  }
}
