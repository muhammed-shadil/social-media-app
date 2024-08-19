import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/followers_bloc/bloc/follow_unfollow_bloc.dart';
import 'package:trek/controller/followers_bloc/fetch_followers/followers_bloc.dart';
import 'package:trek/model/FollewersUnfollowers_model.dart';
import 'package:trek/view/screens/friends/shimmer_followers.dart';
import 'package:trek/view/screens/friends/user_tile.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class MyFollowingsWrapper extends StatelessWidget {
  const MyFollowingsWrapper({super.key});

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
      child: MyFollowings(),
    );
  }
}

class MyFollowings extends StatefulWidget {
  const MyFollowings({super.key});

  @override
  State<MyFollowings> createState() => _MyFollowingsState();
}

class _MyFollowingsState extends State<MyFollowings> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FollowersBloc>(context).add(FetchFollowingsEvent());
  }

  late List<Suggestion> followings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Following"),centerTitle: true,),
      body: Center(
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
                if (state is SuccessFollowings) {
                  followings = state.followings;
                  // print(friends[0].name);
                  if (followings.isEmpty) {
                    return const Center(child: Text("No suggestions found"));
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => UserTile(
                              name: followings[index].name,
                              username: followings[index].username,
                              image: followings[index].profilePicture,
                              enabled: true,
                              uid: followings[index].id, showicon: false,
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: followings.length),
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
    );
  }
}