import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Trek"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Scaffold(
          appBar: AppBar(
            // title: Text("Trek"),
            leadingWidth: 100,
            centerTitle: true,
            leading: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.camera_alt_outlined),
                ),
                Icon(Icons.group_outlined),
                //  Icon(Icons.camera_alt_outlined),
              ],
            ),
            actions: const [
              Icon(Icons.notifications_active_outlined),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
