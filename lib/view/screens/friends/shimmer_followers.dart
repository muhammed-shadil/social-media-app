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
                  baseColor: const Color.fromARGB(255, 31, 32, 38),
                  highlightColor: const Color.fromARGB(255, 54, 55, 61),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                  ),
                ),
                title: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 31, 32, 38),
                    highlightColor: const Color.fromARGB(255, 54, 55, 61),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: const Text("name"))),
                subtitle: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 31, 32, 38),
                    highlightColor: const Color.fromARGB(255, 54, 55, 61),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: const Text("username"))),
                trailing: Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 31, 32, 38),
                  highlightColor: const Color.fromARGB(255, 54, 55, 61),
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
              )
              // UserTile(
              //   name: "friends[index].name",
              //   username: "friends[index].username",
              //   image:
              //       "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
              //   actions: "assets/chat-conversation.png",
              //   enabled: true,
              //   uid: 'jjjjjjj',
              //   showicon: true,
              // ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 10),
    );
  }
}
