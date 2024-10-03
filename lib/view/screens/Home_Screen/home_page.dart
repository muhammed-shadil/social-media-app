import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek/controller/post/cubit/fetch_posts_cubit.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/Home_Screen/shimmer_home.dart';
import 'package:trek/view/screens/Home_Screen/single_post.dart';
import 'package:trek/view/screens/New_Post_screen/new_post_image.dart';
import 'package:trek/view/screens/profile_screen/profile_screen.dart';
import 'package:trek/view/screens/signin/Signin_Screen.dart';
import 'package:trek/view/screens/friends/followers.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FetchPostsCubit()..fetchPosts(),
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController _scrollController = ScrollController();
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
                style: styles.homescreentitle,
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const NewPostWrappper()));
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 25,
                          ),
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
              body: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: BlocBuilder<FetchPostsCubit, FetchPostsState>(
                    builder: (context, state) {
                      if (state is PostLoading) {
                        if (state.posts.isEmpty) {
                          return const shimmer_home();
                        } else {
                          return ListView.builder(
                            controller: _scrollController,
                            key: const PageStorageKey('postList'),
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              if (index == state.posts.length) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return SinglePost(
                                authorDetails: state.posts[index].authorDetails,
                                postType: state.posts[index].contentType,
                                posts: state.posts[index],
                              );
                            },
                          );
                        }
                      } else if (state is PostLoaded) {
                        return NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (_scrollController.position.pixels ==
                                    _scrollController
                                        .position.maxScrollExtent &&
                                state.hasMoreData) {
                              context
                                  .read<FetchPostsCubit>()
                                  .fetchPosts(); // Fetch more posts when reaching the bottom
                            }
                            return false;
                          },
                          child: ListView.builder(
                            controller: _scrollController,
                            key: const PageStorageKey('postList'),
                            itemCount: state.posts.length +
                                (state.hasMoreData ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == state.posts.length) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              print(state.posts[index].blogContent);
                              return SinglePost(
                                authorDetails: state.posts[index].authorDetails,
                                postType: state.posts[index].contentType,
                                posts: state.posts[index],
                              );
                            },
                          ),
                        );
                      } else if (state is PostError) {
                        return Center(child: Text('Error: ${state.message}'));
                      }
                      return Container();
                    },
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
