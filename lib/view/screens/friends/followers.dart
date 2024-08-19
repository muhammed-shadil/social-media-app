import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/followers_bloc/bloc/follow_unfollow_bloc.dart';
import 'package:trek/controller/followers_bloc/fetch_followers/followers_bloc.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/view/screens/friends/shimmer_followers.dart';
import 'package:trek/view/screens/friends/user_tile.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class FollowersScreenWrpper extends StatelessWidget {
  const FollowersScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FollowersBloc(),
        ),
        BlocProvider(
          create: (context) => FollowUnfollowBloc(),
        ),
      ],
      child: const FollowersScreen(),
    );
  }
}

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FollowersBloc>(context).add(FetchFollowerUnfollwerEvent());
  }

  late FollowersUnfollowers find;
  late List<Suggestion> friends;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: const PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: TabBar(
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              labelStyle: TextStyle(fontSize: 23),
              labelPadding: EdgeInsets.only(right: 10, left: 10),
              tabs: [
                SizedBox(
                  child: Tab(
                    text: "Friends",
                  ),
                ),
                Tab(
                  text: "Find",
                )
              ],
              labelColor: constants.white,
            ),
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: const SearchTextfield(
                      preicon: Icons.search,
                      hinttext: "search your friend",
                      keyboard: TextInputType.name,
                    ),
                  ),
                  BlocBuilder<FollowersBloc, FollowersState>(
                      builder: (context, state) {
                    if (state is SuccessFollewersUnfollowers) {
                      friends = state.suggestons;
                      // print(friends[0].name);
                      if (friends.isEmpty) {
                        return const Center(
                            child: Text("No Friends found"));
                      }
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => UserTile(
                                  name: friends[index].name,
                                  username: friends[index].username,
                                  image: friends[index].profilePicture,
                                  enabled: false,
                                  uid: friends[index].id,
                                  showicon: true,
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: friends.length),
                      );
                    } else if (state is FetchFollowLoadingstate) {
                      return const ShimmerFollowers();
                    } else if (state is FaildFollewersUnfollowers) {
                      // print(state.error);
                      return Text(state.error);
                    }
                    return const Center(
                      child: Text("No data available"),
                    );
                  })
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: const SearchTextfield(
                      preicon: Icons.search,
                      hinttext: "Find your friend",
                      keyboard: TextInputType.name,
                    ),
                  ),
                  BlocBuilder<FollowersBloc, FollowersState>(
                      builder: (context, state) {
                    if (state is SuccessFollewersUnfollowers) {
                      find = state.followersUnfollowers;
                      if (find.suggestions.isEmpty) {
                        return const Center(
                            child: Text("No suggestions found"));
                      }
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => UserTile(
                                  // pressed: () {
                                  //   // print("eeeeeeeeeeee");
                                  // },
                                  name: find.suggestions[index].name,
                                  username: find.suggestions[index].username,
                                  image: find.suggestions[index].profilePicture,
                                  enabled: true,
                                  uid: find.suggestions[index].id,
                                  showicon: true,
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: find.suggestions.length),
                      );
                    } else if (state is FetchFollowLoadingstate) {
                      return const ShimmerFollowers();
                    } else if (state is FaildFollewersUnfollowers) {
                      // print(state.error);
                      return Text(state.error);
                    }
                    return const Text("No data available");
                  })
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
