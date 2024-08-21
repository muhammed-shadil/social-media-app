import 'package:flutter/material.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      iconColor: constants.white,
      iconSize: 30,
      splashRadius: 7,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      itemBuilder: (context) => [
        // Edit Profile
        const PopupMenuItem(padding: EdgeInsets.zero,
          value: 1,
          child: Center(
              child: Text("Edit Profile", style: styles.popupMenuButton)),
        ),
        // Divider

        // Delete Post
        const PopupMenuItem(padding: EdgeInsets.zero,
          child:
              Center(child: Text("Delete Post", style: styles.popupMenuButton)),
        ),
        // Divider

        // Saved Post
        const PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 3,
          child:
              Center(child: Text("Saved Post", style: styles.popupMenuButton)),
        ),
        // Divider

        // Settings
        const PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 4,
          child: Center(child: Text("Settings", style: styles.popupMenuButton)),
        ),
        // Divider

        // Logout
        PopupMenuItem(
          value: 5,
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: constants.secodarycolor)),
                  child: Text("Logout", style: styles.popupMenuButton))),
        ),
      ],
      // offset: Offset(0, 100),
      color: constants.fillcolor, // Background color of the popup menu
      elevation: 2,
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.pushNamed(context, '/editProfile');
            break;
          case 2:
            Navigator.pushNamed(context, '/deletePost');
            break;
          case 3:
            Navigator.pushNamed(context, '/savedPost');
            break;
          case 4:
            Navigator.pushNamed(context, '/settings');
            break;
          case 5:
            Navigator.pushNamed(context, '/logout');
            break;
        }
      },
    );
  }
}
