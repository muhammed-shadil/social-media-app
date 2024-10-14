import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/controller/User_profile/bloc/userprofile_bloc.dart';
import 'package:trek/model/UserProfile.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/Edit_profile_screen/edit_profile_screen.dart';
import 'package:trek/view/screens/my_following/my_followings.dart';
import 'package:trek/view/screens/profile_screen/Mypostscreen.dart';
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
  bool isCurrentUser = false;
  final List<Post> media = [];
  final List<Post> blog = [];
  @override
  void initState() {
    super.initState();
    _initializeUserId(); // Moved logic to an async function
  }

  Future<void> _initializeUserId() async {
    final currentUserId = await _getUserId(); // Wait for the future to resolve

    if (widget.userid == null || widget.userid == currentUserId) {
      // Current user's profile
      setState(() {
        isCurrentUser = true;
      });
      BlocProvider.of<UserprofileBloc>(context)
          .add(CurrentUserProfile(id: currentUserId!));
    } else {
      setState(() {
        isCurrentUser = false;
      });
      BlocProvider.of<UserprofileBloc>(context)
          .add(UserProfile(id: widget.userid!));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserprofileBloc, UserprofileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return const ShimmerProfile();
          } else if (state is UserProfileFaild) {
            return Center(child: Text(state.error));
          } else if (state is UserProfileSuccess) {
            result = state.userProfiles;

            for (var post in result.posts) {
              if (post.contentType == "Image") {
                media.add(post);
              } else {
                blog.add(post);
              }
            }

            return DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Image.network(
                                result.user.profilePicture!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      constants.transparent,
                                      constants.transparent,
                                      constants.blackOP5,
                                      constants.blackOP9,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          result.user.name,
                                          style: styles.bio,
                                        ),
                                        Text(
                                          result.user.username,
                                          style: styles.postlocation,
                                        ),
                                        constants.height3,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: MainButton(
                                        child: const Text(
                                          "Edit Profile",
                                          style: styles.mainbuttontext,
                                        ),
                                        onpressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const EditProfileScreen()));
                                        },
                                      )),
                                  const PopupMenu(),
                                ],
                              )
                            : Center(
                                child: MainButton(
                                  child: const Text(
                                    "Follow",
                                    style: styles.mainbuttontext,
                                  ),
                                  onpressed: () {},
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
                body: Column(
                  children: [
                    const TabBar(
                      dividerHeight: 0.3,
                      indicatorColor: Colors.transparent,
                      // dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.fill,
                      labelStyle: TextStyle(fontSize: 18),
                      labelPadding: EdgeInsets.only(top: 10),

                      // indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(text: "Media"),
                        Tab(text: "Blog"),
                      ],
                      labelColor: Colors.white,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildMediaTab(),
                          _buildBlogTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildMediaTab() {
    return media.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap:
                  true, // Ensures the grid view takes only necessary space
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.75,
              ),
              itemCount: media.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MypostscreenWrpper(
                                  post: media,
                                  name: result.user.name,
                                  username: result.user.username,
                                  profileimage: result.user.profilePicture!,
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: constants.blackOP2,
                          blurRadius: 5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          media[index].imageUrl!,
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              },
            ),
          )
        : const Center(
            child: Text("No Medias yet"),
          );
  }

  Widget _buildBlogTab() {
    return blog.isNotEmpty
        ? ListView.separated(
            itemCount: blog.length,
            separatorBuilder: (BuildContext context, int index) {
              return constants.height20;
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Mypostscreen(
                                post: blog,
                                name: result.user.name,
                                username: result.user.username,
                                profileimage: result.user.profilePicture!,
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: constants.fillcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    blog[index].caption ?? "no caption",
                    style: styles.textfieldhintstyle,
                  )),
                ),
              );
            },
          )
        : const Center(child: Text("No Blogs yet"));
  }
}

Future<String?> _getUserId() async {
  final sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getString(constants.userid);
}
