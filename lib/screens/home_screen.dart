import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'package:social_media/api/api_service.dart';
import 'package:social_media/models/app_data.dart';
import 'package:social_media/screens/post_details_screen.dart';
import 'package:social_media/screens/search_screen.dart';
import 'package:social_media/screens/user_profile_screen.dart';
import 'package:social_media/screens/write_post_screen.dart';

final AppData appData1 = Get.find<AppData>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key} );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();
    //print('Home Screen Reloaded***************************************');
    appData1.fetchPosts();
    appData1.observableCommentList.clear();
  }
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Posts'),
        actions: [
          IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return WritePostScreen();
              },));
            }, icon: const Icon(Icons.add_circle_sharp)),

          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchScreen();
            },));
          }, icon: const Icon(Icons.search)),

          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: const Text('Scroll down to the bottom to see the latest posts'),
                actions: [
                  Center(
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                      },
                      child: const Text('Okay!')),
                ),
              ],);
            },);
            }, icon: const Icon(Icons.info))

        ],),

      body: Column(
        children: [
          const SizedBox(height: 10,),
          
          Obx(() => postsLoading.value == true ? const Center(child: CircularProgressIndicator(),) : Expanded(
              child: Obx(()=>
                 ListView.builder(
                   controller: _scrollController,
                  itemCount: appData1.observablePostsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11),
                      child: Card(
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              InkWell(
                                child: Row(children: [
                                  const Text('Post ID : '),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(appData1.observablePostsList[index].id.toString()),
                                  ),
                                  const Spacer(),
                                  const Text('User ID : '),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(appData1.observablePostsList[index].userId.toString()),
                                  ),
                                ],),
                                onTap: () {
                                  //ApiServices().fetchUser(AppData.instance.observablePosts[index].userId!);
                                  //appData1.userId = appData1.observablePosts[index].userId ?? 1;

                                  appData1.fetchUserData(appData1.observablePostsList[index].userId ?? 1);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                    return UserProfileScreen();
                                  },));

                                },
                              ),

                              Text(appData1.observablePostsList[index].title ?? 'No Title', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
                                child: Text(appData1.observablePostsList[index].body ?? 'No Body'),
                              ),
                              InkWell(
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('See all Comments', style: TextStyle(fontSize: 12),),
                                    ),
                                    const Spacer(),
                                    IconButton(onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                        return PostDetailsScreen();
                                      },));
                                    }, icon: const Icon(Icons.chevron_right))

                                  ],
                                ),
                                onTap: () {
                                  //appData1.postId = index+1;

                                  // print(AppData.instance.postId);

                                  appData1.fetchComments(index+1);

                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                    return PostDetailsScreen();
                                  },));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 10),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_downward),
      ),
    );
  }
}
