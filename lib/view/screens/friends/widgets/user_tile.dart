// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trek/controller/followers_bloc/bloc/follow_unfollow_bloc.dart';
import 'package:trek/controller/followers_bloc/cubit/user_tile_cubit_cubit.dart';
import 'package:trek/utils/constants.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String username;
  final String image;
  final String? actions;
  final Function()? pressed;
  final bool enabled;
  final String uid;
  final bool showicon;

  const UserTile({
    super.key,
    required this.name,
    required this.username,
    required this.image,
    this.actions,
    this.pressed,
    required this.enabled,
    required this.uid,
    required this.showicon,
  });

  @override
  Widget build(BuildContext context) {
    final followbloc = BlocProvider.of<FollowUnfollowBloc>(context);
    return BlocProvider(
      create: (context) => UserTileCubit(showicon),
      child: BlocBuilder<UserTileCubit, bool>(
        builder: (context, isFollow) {
          return ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: constants.fillcolor,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
            title: Text(name),
            subtitle: Text(username),
            trailing: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: constants.backgroundColor,
              ),
              child: GestureDetector(
                onTap: enabled
                    ? () {
                        context.read<UserTileCubit>().toggleFollow();
                        if (isFollow) {
                          followbloc.add(FollowingEvent(id: uid));
                        } else {
                          followbloc.add(UnfollowingEvent(id: uid));
                        }
                      }
                    : null,
                child: BlocBuilder<FollowUnfollowBloc, FollowUnfollowState>(
                  builder: (context, state) {
                    if (state is Following) {
                      return enabled
                          ? Image.asset(isFollow
                              ? "assets/user-add.png"
                              : "assets/user-checked.png")
                          : Image.asset("assets/chat-conversation.png");
                    }
                    return enabled
                        ? Image.asset(isFollow
                            ? "assets/user-add.png"
                            : "assets/user-checked.png")
                        : Image.asset("assets/chat-conversation.png");
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
