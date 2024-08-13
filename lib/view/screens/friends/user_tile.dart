import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/followers_bloc/bloc/follow_unfollow_bloc.dart';
import 'package:trek/utils/constants.dart';
import "dart:developer" as developer;

class UserTile extends StatefulWidget {
  const UserTile({
    Key? key,
    required this.name,
    required this.username,
    required this.image,
    this.actions,
    this.pressed,
    required this.enabled,
    required this.uid,
  }) : super(key: key);
  final String name;
  final String username;
  final String image;
  final String? actions;
  final Function()? pressed;
  final bool enabled;
  final String uid;
  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  bool isFollow = true;
  @override
  Widget build(BuildContext context) {
    developer.log('the initial value of isfollow is $isFollow');
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: constants.fillcolor,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.image),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.username),
      trailing: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: constants.backgroundColor,
        ),
        child: GestureDetector(
          onTap: widget.enabled
              ? () {
                  print("$isFollow on pressed");
                  isFollow
                      ? BlocProvider.of<FollowUnfollowBloc>(context)
                          .add(FollowingEvent(id: widget.uid))
                      : BlocProvider.of<FollowUnfollowBloc>(context)
                          .add(UnfollowingEvent(id: widget.uid));
                }
              : null,
          child: BlocBuilder<FollowUnfollowBloc, FollowUnfollowState>(
            builder: (context, state) {
              developer.log('the current state is $state');
              if (state is Loadingstate) {
                print("loading staate");
                return Transform.scale(
                    scale: 0.6,
                    child: const CircularProgressIndicator(
                      color: constants.white,
                    ));
              } else if (state is Following) {
                print("$isFollow on folooeing");

                print(state.follow);
                isFollow = state.follow;
                developer.log('the value of isfollow variable is $isFollow');
                return widget.enabled
                    ? Image.asset(isFollow
                        ? "assets/user-add.png"
                        : "assets/user-checked.png")
                    : Image.asset("assets/chat-conversation.png");
              } else if (state is Faildfollow) {
                print(state.error);
              }
              return widget.enabled
                  ? Image.asset(isFollow
                      ? "assets/user-add.png"
                      : "assets/user-checked.png")
                  : Image.asset("assets/chat-conversation.png");
            },
          ),
        ),
      ),
    );
  }
}
