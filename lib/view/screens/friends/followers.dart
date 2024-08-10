import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trek/controller/followers_bloc/bloc/followers_bloc.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/view/screens/friends/shimmer_followers.dart';
import 'package:trek/view/screens/friends/user_tile.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class FollowersScreenWrpper extends StatelessWidget {
  const FollowersScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowersBloc(),
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
    BlocProvider.of<FollowersBloc>(context).add(FollowerUnfollwerEvent());
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
                          find = state.followersUnfollowers;
                          friends = state.suggestons;
                          return Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) => UserTile(
                                      name: friends[index].name,
                                      username: friends[index].username,
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: friends.length),
                          );
                        }
                        return const ShimmerFollowers();
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

                          return Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) => UserTile(
                                      name: find.suggestions[index].name,
                                      username:
                                          find.suggestions[index].username,
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: find.suggestions.length
                                // 3
                                ),
                          );
                        }
                        return const ShimmerFollowers();
                      })
                    ],
                  ),
                ),
              ),
            ])));
  }
}
