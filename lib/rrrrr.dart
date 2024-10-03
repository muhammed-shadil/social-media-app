import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/view/screens/Home_Screen/single_post.dart';
import 'package:trek/view/screens/profile_screen/profile_screen.dart';
import 'package:trek/view/screens/signin/Signin_Screen.dart';
import 'package:trek/view/screens/friends/followers.dart';

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
                leadingWidth: 130,
                centerTitle: true,
                leading: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 25,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const FollowersScreenWrpper()));
                        },
                        child: const Icon(
                          Icons.group_outlined,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () async {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Signinwrapper()));
                      },
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        size: 25,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfileScreenWrapper()));
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/gondola-ride-in-autumn-in-kashmir-2023-10-18t174214.790-min.png"),
                    ),
                  ),
                ],
              ),
              body: const SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
