import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.name, required this.username});
  final String name;
  final String username;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: constants.fillcolor,
      leading: const CircleAvatar(
        backgroundImage:
            AssetImage("assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"),
      ),
      title: Text(name),
      subtitle: Text(username),
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
