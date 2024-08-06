import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/followers_bloc/bloc/followers_bloc.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/view/screens/friends/user_tile.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class FollowersScreenWrpper extends StatelessWidget {
  const FollowersScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowersBloc(),
      child: FollowersScreen(),
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

  late FollowersUnfollowers followersUnfollowers;
  late Suggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowersBloc, FollowersState>(
      builder: (context, state) {
        if (state is SuccessFollewersUnfollowers) {
          print("stateeeskkkkkkkkkkkkk");
          followersUnfollowers = state.followersUnfollowers;
          suggestion = state.suggestion;
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                leading: const Icon(Icons.arrow_back_ios_new),
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
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => UserTile(
                                    name: followersUnfollowers
                                        .suggestions[index].name!,
                                    username: followersUnfollowers
                                        .suggestions[index].username,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount:
                                  followersUnfollowers.suggestions.length),
                        )
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
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => UserTile(
                                    name: suggestion.name!,
                                    username: suggestion.username,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: 10),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        return Container();
      },
    );
  }
}
