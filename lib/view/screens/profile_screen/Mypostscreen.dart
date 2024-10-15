// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/post/delete/delete_post_bloc.dart';
import 'package:trek/model/UserProfile.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/profile_screen/profile_screen.dart';

class MypostscreenWrpper extends StatelessWidget {
  const MypostscreenWrpper({
    super.key,
    required this.isCurrentUser,
    required this.post,
    required this.name,
    required this.username,
    required this.profileimage,
  });
  final bool isCurrentUser;
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
        isCurrentUser: isCurrentUser,
      ),
    );
  }
}

class Mypostscreen extends StatefulWidget {
  const Mypostscreen(
      {super.key,
      required this.isCurrentUser,
      required this.post,
      required this.name,
      required this.username,
      required this.profileimage});
  final bool isCurrentUser;

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
    bool isExpanded = false;
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
        body: BlocListener<DeletePostBloc, DeletePostState>(
          listener: (context, state) {
            if (state is SuccessfullyDeletePost) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProfileScreenWrapper()));
            } else if (state is FaildDeletePost) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is LoadingDeletePost) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Center(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Deleting ...'),
                  CircularProgressIndicator(
                    color: constants.white,
                  ),
                ],
              ))));
            }
          },
          child: Center(
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
                                  widget.isCurrentUser
                                      ? IconButton(
                                          onPressed: () {
                                            BlocProvider.of<DeletePostBloc>(
                                                    context)
                                                .add(DeletePost(
                                                    id: widget.post[index].id));
                                          },
                                          icon: const Icon(Icons.delete))
                                      : CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(widget.profileimage),
                                        ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  widget.isCurrentUser
                                      ? IconButton(
                                          onPressed: () {
                                            BlocProvider.of<DeletePostBloc>(
                                                    context)
                                                .add(DeletePost(
                                                    id: widget.post[index].id));
                                          },
                                          icon: const Icon(Icons.delete))
                                      : CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(widget.profileimage),
                                        ),
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
      ),
    );
  }

  Widget buildLargeImage(double screenWidth, double screenHeight, int index) {
     final blogContent = widget.post[index].blogContent ?? "No content available";
    final truncatedContent = blogContent.length > 400
        ? "${blogContent.substring(0, 400)}..."
        : blogContent;
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
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: const Border(
                          left: BorderSide(color: constants.white, width: 0.1),
                          right: BorderSide(color: constants.white, width: 0.1),
                          bottom: BorderSide(color: constants.white),
                          top: BorderSide(color: constants.white))),
                  child: SingleChildScrollView(
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
                                    children: [
                    constants.height20,
                    Text(
                      isExpanded ? blogContent : truncatedContent,
                      style: styles.postlocation,
                      maxLines: isExpanded ? null : 14,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                    if (blogContent.length > 400)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Text(
                          isExpanded ? "Show Less" : "Read More",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                                    ],
                                  ),
                      ],
                    ),
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
