import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/Signin_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            title: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Trek",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.center,
                  labelStyle: TextStyle(fontSize: 21),
                  tabs: [
                    Tab(
                      text: "Following",
                      height: 30,
                    ),
                    Tab(
                      text: "Discover",
                    )
                  ],
                  labelColor: Colors.white,
                ),
                toolbarHeight: 50,
                // title: Text("Trek"),
                leadingWidth: 130,
                centerTitle: true,
                leading: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        ),
                      ),
                      Icon(
                        Icons.group_outlined,
                        size: 35,
                      ),
                      //  Icon(Icons.camera_alt_outlined),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: IconButton(
                        onPressed: () async {
                          var sharedPref =
                              await SharedPreferences.getInstance();
                          sharedPref.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const signinwrapper()));
                        },
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                          size: 30,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(child: Container()
                  // Column(
                  //   children: [
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 400,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //     Container(
                  //       color: Colors.amber,
                  //       height: 100,
                  //       width: 200,
                  //       child: Text("data"),
                  //     ),
                  //   ],
                  // ),
                  )),
        ),
      ),
    );
  }
}
