// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/post/delete/delete_post_bloc.dart';
import 'package:trek/model/UserProfile.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';

class MypostscreenWrpper extends StatelessWidget {
  const MypostscreenWrpper({
    super.key,
    required this.post,
    required this.name,
    required this.username,
    required this.profileimage,
  });
  final List<Post> post;
  final String name;
  final String username;
  final String profileimage;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeletePostBloc(),
      child: Mypostscreen(
        post: post,
        name: name,
        username: username,
        profileimage: profileimage,
      ),
    );
  }
}

class Mypostscreen extends StatefulWidget {
  const Mypostscreen(
      {super.key,
      required this.post,
      required this.name,
      required this.username,
      required this.profileimage});
  final List<Post> post;
  final String name;
  final String username;
  final String profileimage;
  @override
  State<Mypostscreen> createState() => _MypostscreenState();
}

class _MypostscreenState extends State<Mypostscreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isSwapped = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => DeletePostBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Posts"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.separated(
              itemCount: widget.post.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: screenHeight * 0.78,
                  width: screenWidth * 0.9,
                  child: Stack(
                    children: [
                      // Large Image (conditionally behind or in front based on isSwapped)
                      if (!isSwapped)
                        buildLargeImage(screenWidth, screenHeight, index),
                      buildSmallImage(screenWidth, screenHeight, index),
                      if (isSwapped)
                        buildLargeImage(screenWidth, screenHeight, index),

                      // Text and Avatar (unchanged)
                      widget.post[index].contentType == "Image"
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.post[index].contentType == "Image"
                                    ? Container(
                                        width: 25,
                                      )
                                    : const SizedBox(),
                                const Spacer(),
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.username,
                                        style: styles.usernamefont,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        widget.name,
                                        style: styles.postlocation,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<DeletePostBloc>(context)
                                          .add(DeletePost(
                                              id: widget.post[index].id));
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.username,
                                        style: styles.usernamefont,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        widget.name,
                                        style: styles.postlocation,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<DeletePostBloc>(context)
                                          .add(DeletePost(
                                              id: widget.post[index].id));
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  constants.height10,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLargeImage(double screenWidth, double screenHeight, int index) {
    return AnimatedPositioned(
      top: isSwapped ? 5 : 70,
      left: isSwapped ? 5 : 0,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: isSwapped
            ? () {
                // Handle tap on small image when it's smaller
                setState(() {
                  isSwapped = !isSwapped;
                });
              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isSwapped ? 90 : screenWidth * 0.9,
          height: isSwapped ? 120 : screenHeight * 0.6,
          decoration: BoxDecoration(
            image: widget.post[index].contentType == "Image"
                ? DecorationImage(
                    image: NetworkImage(
                      widget.post[index].imageUrl!,
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
            borderRadius: isSwapped
                ? const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )
                : BorderRadius.circular(30),
            border: Border.all(
              width: isSwapped ? 5 : 0,
              color: isSwapped ? constants.backgroundColor : Colors.transparent,
            ),
          ),
          child: widget.post[index].contentType == "Blog"
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: const Border(
                          left: BorderSide(color: constants.white, width: 0.1),
                          right: BorderSide(color: constants.white, width: 0.1),
                          bottom: BorderSide(color: constants.white),
                          top: BorderSide(color: constants.white))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.post[index].caption ?? "No caption",
                        style: styles.blogtitle,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.post[index].blogContent!,
                              style: styles.postlocation,
                            ),
                          ])
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget buildSmallImage(double screenWidth, double screenHeight, int index) {
    return widget.post[index].contentType == "Image"
        ? AnimatedPositioned(
            top: isSwapped ? 70 : 5,
            left: isSwapped ? 0 : 5,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onTap: isSwapped
                  ? null
                  : () {
                      // Handle tap on small image when it's smaller
                      setState(() {
                        isSwapped = !isSwapped;
                      });
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isSwapped ? screenWidth * 0.9 : 90,
                height: isSwapped ? screenHeight * 0.6 : 120,
                decoration: BoxDecoration(
                  border: isSwapped
                      ? Border.all(width: 0, color: Colors.transparent)
                      : Border.all(width: 5, color: constants.backgroundColor),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: isSwapped
                      ? BorderRadius.circular(30)
                      : const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                ),
              ),
            ),
          )
        : Container();
  }
}
