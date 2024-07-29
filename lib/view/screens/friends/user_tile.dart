import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: constants.fillcolor,
      leading: CircleAvatar(
        backgroundImage:
            AssetImage("assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"),
      ),
      title: Text("Rockst Albert"),
      subtitle: Text("rocks_se"),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: constants.backgroundColor,
        ),
        child: Image.asset("assets/chat-conversation.png"),
      ),
    );
  }
}
