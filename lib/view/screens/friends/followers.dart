import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trek/view/screens/friends/user_tile.dart';
import 'package:trek/view/widgets/search_textfield.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios_new),
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
              labelColor: Colors.white,
            ),
          ),
        ),
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
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => const UserTile(),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
