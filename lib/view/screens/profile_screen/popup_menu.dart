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
        const PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 1,
          child:
              Center(child: Text("Saved Posts", style: styles.popupMenuButton)),
        ),
        const PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 2,
          child: Center(child: Text("Settings", style: styles.popupMenuButton)),
        ),
        PopupMenuItem(
          value: 3,
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: constants.secodarycolor)),
                  child: const Text("Logout", style: styles.popupMenuButton))),
        ),
      ],
      // offset: Offset(0, 100),
      color: constants.fillcolor, // Background color of the popup menu
      elevation: 2,
      onSelected: (value) {
        switch (value) {
          case 1:
            Navigator.pushNamed(context, '/savedPost');
            break;
          case 2:
            Navigator.pushNamed(context, '/settings');
            break;
          case 3:
            Navigator.pushNamed(context, '/logout');
            break;
        }
      },
    );
  }
}
