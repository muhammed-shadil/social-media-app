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
import 'package:trek/view/widgets/main_button.dart';

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserprofileBloc(),
      child: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() async {
    super.initState();
    final sharedpref = await SharedPreferences.getInstance();
    final id = sharedpref.getString(constants.userid);
    BlocProvider.of<UserprofileBloc>(context).add(CurrentUserProfile());
  }

  late CurrentUserProfiles result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserprofileBloc, UserprofileState>(
          builder: (context, state) {
        if (state is UserProfileLoading) {
          return const CircularProgressIndicator();
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
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const MyFollowingsWrapper()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Following"),
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
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    result.user.bio == ''
                        ? "welcome to my profile"
                        : result.user.bio,
                    style: styles.bio,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: MainButton(
                        child: const Text(
                          "Follow",
                          style: styles.mainbuttontext,
                        ),
                        onpressed: () {},
                      ),
                    ),
                    constants.width10,
                    const Icon(
                      Icons.more_vert_outlined,
                      size: 30,
                      color: constants.white,
                    ),
                  ],
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
      }),
    );
  }
}
