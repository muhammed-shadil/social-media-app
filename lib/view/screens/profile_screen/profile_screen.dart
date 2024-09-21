import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/controller/User_profile/bloc/userprofile_bloc.dart';
import 'package:trek/controller/authentication_bloc/login_bloc.dart';
import 'package:trek/model/UserProfile.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/my_following/my_followings.dart';
import 'package:trek/view/screens/profile_screen/Shimmer_profile.dart';
import 'package:trek/view/screens/profile_screen/popup_menu.dart';
import 'package:trek/view/widgets/main_button.dart';

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({super.key, this.userid});
  final String? userid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserprofileBloc(),
      child: ProfileScreen(
          userid: userid), // Pass the userid down to ProfileScreen
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.userid});
  final String? userid;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<String?> _futureUserId;
  late CurrentUserProfiles result;
  bool isCurrentUser =
      false; // Flag to determine if the profile is of the current user

  @override
  void initState() {
    super.initState();

    // Determine if the profile to display is for the current user or another user
    if (widget.userid == null) {
      // No userid provided, it's the current user's profile
      _futureUserId = _getUserId();
      _futureUserId.then((userId) {
        setState(() {
          isCurrentUser = true;
        });
        BlocProvider.of<UserprofileBloc>(context)
            .add(CurrentUserProfile(id: userId!));
      });
    } else {
      // Another user's profile, use the provided userid
      isCurrentUser = false;
      BlocProvider.of<UserprofileBloc>(context)
          .add(UserProfile(id: widget.userid!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserprofileBloc, UserprofileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return ShimmerProfile();
          } else if (state is UserProfileFaild) {
            return Text(state.error);
          } else if (state is UserProfileSuccess) {
            result = state.userProfiles;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/christopher-campbell-rDEOVtE7vOs-unsplash.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.9),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      result.user.name,
                                      style: styles.bio,
                                    ),
                                    Text(
                                      result.user.username,
                                      style: styles.postlocation,
                                    ),
                                    constants.height3
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const MyFollowingsWrapper(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text("Following"),
                                      Text(result.user.following.length
                                          .toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      result.user.bio == null || result.user.bio!.isEmpty
                          ? "Welcome to my profile"
                          : result.user.bio!,
                      style: styles.bio,
                    ),
                  ),
                  isCurrentUser
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: MainButton(
                                  child: const Text(
                                    "Edit Profile",
                                    style: styles.mainbuttontext,
                                  ),
                                  onpressed: () {},
                                )),
                            const PopupMenu()
                          ],
                        )
                      : Center(
                          child: MainButton(
                            child: const Text(
                              "Follow",
                              style: styles.mainbuttontext,
                            ),
                            onpressed: () {
                              // Implement Follow/Unfollow logic
                            },
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: result.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/gondola-ride-in-autumn-in-kashmir-2023-10-18t174214.790-min.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Future<String?> _getUserId() async {
  final sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getString(constants.userid);
}
