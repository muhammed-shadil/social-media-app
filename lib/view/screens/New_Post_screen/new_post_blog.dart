import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trek/controller/post/newpost/bloc/newpost_bloc.dart';
import 'package:trek/utils/constants.dart';
import 'package:trek/utils/styles.dart';
import 'package:trek/view/widgets/main_button.dart';
import 'package:trek/view/widgets/main_textfield.dart';

class NewPostBlogWrapper extends StatelessWidget {
  const NewPostBlogWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewpostBloc(),
      child: NewPostBlog(),
    );
  }
}

class NewPostBlog extends StatelessWidget {
  NewPostBlog({super.key});

  TextEditingController captioncontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final createpost = BlocProvider.of<NewpostBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: BlocListener<NewpostBloc, NewpostState>(
          listener: (context, state) {
            if (state is LoadingCreatePost) {
              const CircularProgressIndicator.adaptive();
            } else if (state is SuccessfullyCreatePost) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pop(context);
            } else if (state is FaildCreatePost) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Quote your words",
                            style: styles.imagepickertitle,
                          ),
                          constants.height10,
                          MainTextfield(
                            controller: captioncontroller,
                            space: true,
                            maxlines: 1,
                            preicon: Icons.library_books_outlined,
                            hinttext: "Enter you words",
                            namefield: "Title",
                            keyboard: TextInputType.multiline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.length < 3) {
                                return 'Enter at least 3 letters';
                              }
                              return null;
                            },
                          ),
                          constants.height20,
                          MainTextfield(
                            controller: contentcontroller,
                            space: true,
                            maxlines: 5,
                            hinttext: "Explain you words",
                            namefield: "Content",
                            keyboard: TextInputType.multiline,
                            validator: (value) {
                              List<String> words =
                                  value.trim().split(RegExp(r'\s+'));
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (words.length < 2) {
                                return 'Please enter at least two words';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: MainButton(
                          onpressed: () {
                            if (formKey.currentState!.validate()) {
                              createpost.add(CreateNewPost(
                                  blogContent: contentcontroller.text,
                                  postType: 'Blog',
                                  caption: captioncontroller.text));
                            }
                          },
                          child: BlocBuilder<NewpostBloc, NewpostState>(
                            builder: (context, state) {
                              if (state is LoadingCreatePost) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                              return const Text(
                                "Post",
                                style: styles.mainbuttontext,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
