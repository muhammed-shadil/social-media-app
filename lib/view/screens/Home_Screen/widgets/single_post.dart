import 'package:flutter/material.dart';
import 'package:trek/model/postmodel.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/screens/profile_screen/profile_screen.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({
    super.key,
    required this.postType,
    required this.authorDetails,
    required this.posts,
  });

  final String postType;
  final AuthorDetails authorDetails;
  final Fetchpost posts;

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost>
    with AutomaticKeepAliveClientMixin {
  bool isSwapped = false;
  bool isExpanded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.78,
      width: screenWidth * 0.9,
      child: Stack(
        children: [
          if (!isSwapped) buildLargeImage(screenWidth, screenHeight),
          buildSmallImage(screenWidth, screenHeight),
          if (isSwapped) buildLargeImage(screenWidth, screenHeight),
          widget.postType == "Image" ? buildAuthorRow() : buildAuthorRowBlog(),
        ],
      ),
    );
  }

  Widget buildLargeImage(double screenWidth, double screenHeight) {
    return AnimatedPositioned(
      top: isSwapped ? 5 : 70,
      left: isSwapped ? 5 : 0,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: isSwapped
            ? () {
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
            image: widget.postType == "Image"
                ? DecorationImage(
                    image: NetworkImage(widget.posts.imageUrl!),
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
          child: widget.postType == "Blog" ? buildBlogContent() : null,
        ),
      ),
    );
  }

  Widget buildBlogContent() {
    final blogContent = widget.posts.blogContent ?? "No content available";
    final truncatedContent = blogContent.length > 400
        ? "${blogContent.substring(0, 400)}..."
        : blogContent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: const Border(
          left: BorderSide(color: constants.white, width: 0.1),
          right: BorderSide(color: constants.white, width: 0.1),
          bottom: BorderSide(color: constants.white),
          top: BorderSide(color: constants.white),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              textAlign: TextAlign.start,
              widget.posts.caption ?? "No caption",
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
                  overflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
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
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAuthorRow() {
    // Your author details row implementation remains unchanged.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.postType == "Image"
            ? Container(
                width: 25,
              )
            : const SizedBox(),
        const Spacer(),
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorDetails.username,
                style: styles.usernamefont,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.authorDetails.name,
                style: styles.postlocation,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreenWrapper(
                  userid: widget.authorDetails.id,
                ),
              ),
            );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.authorDetails.profilePicture),
          ),
        ),
      ],
    );
  }

  Widget buildAuthorRowBlog() {
    // Your author details row implementation remains unchanged.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorDetails.username,
                style: styles.usernamefont,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.authorDetails.name,
                style: styles.postlocation,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreenWrapper(
                  userid: widget.authorDetails.id,
                ),
              ),
            );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.authorDetails.profilePicture),
          ),
        ),
      ],
    );
  }

  Widget buildSmallImage(double screenWidth, double screenHeight) {
    return widget.postType == "Image"
        ? AnimatedPositioned(
            top: isSwapped ? 70 : 5,
            left: isSwapped ? 0 : 5,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onTap: isSwapped
                  ? null
                  : () {
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
                        "assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg"),
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
