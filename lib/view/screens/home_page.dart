import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/view/screens/Signin_Screen.dart';

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
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.center,
                    labelStyle: TextStyle(fontSize: 18),
                    labelPadding: EdgeInsets.only(right: 10, left: 10),
                    tabs: [
                      SizedBox(
                        child: Tab(
                          text: "Following",
                        ),
                      ),
                      Tab(
                        text: "Discover",
                      )
                    ],
                    labelColor: Colors.white,
                  ),
                ),
                toolbarHeight: 40,
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
                          size: 25,
                        ),
                      ),
                      Icon(
                        Icons.group_outlined,
                        size: 25,
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
                          size: 25,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 25,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 40, 39, 37),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Stack(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Column(
                                    children: [
                                      Text("Victor Daniel"),
                                      Text("Agra, New Delhi"),
                                    ],
                                  ),Text("data")
                                  // CircleAvatar(
                                  //   backgroundImage: AssetImage(
                                  //       "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg"),
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
