import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek/view/screens/friends/user_tile.dart';

class ShimmerFollowers extends StatelessWidget {
  const ShimmerFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 31, 32, 38),
              highlightColor: const Color.fromARGB(255, 54, 55, 61),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: const UserTile(
                  name: "friends[index].name",
                  username: "friends[index].username",
                  image:
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                  actions: "assets/chat-conversation.png",
                  enabled: true,
                  uid: 'jjjjjjj',
                ),
              )),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 10),
    );
  }
}
