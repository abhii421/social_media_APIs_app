import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/api/api_service.dart';
import 'package:social_media/models/app_data.dart';
import 'package:social_media/screens/post_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {

    super.initState();
    AppData.instance.fetchPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          // ElevatedButton(onPressed: () {
          //       //ApiServices().getPosts();
          //       AppData.instance.fetchPosts();
          //       print(AppData.instance.observablePosts);
          //   }, child: Text('print')),



          Expanded(
            child: Obx(()=>
               ListView.builder(
                itemCount: AppData.instance.observablePosts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11),
                    child: Card(
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Row(children: [
                              Text('Post ID : '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(AppData.instance.observablePosts[index].id.toString()),
                              ),
                              Spacer(),
                              Text('User ID : '),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(AppData.instance.observablePosts[index].userId.toString()),
                              ),
                            ],),

                            Text(AppData.instance.observablePosts[index].title ?? 'No Title', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
                              child: Text(AppData.instance.observablePosts[index].body ?? 'No Body'),
                            ),
                            InkWell(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('See all Comments', style: TextStyle(fontSize: 12),),
                                  ),
                                  Spacer(),
                                  IconButton(onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return PostDetailsScreen();
                                    },));
                                  }, icon: const Icon(Icons.chevron_right))

                                ],
                              ),
                              onTap: () {
                                AppData.instance.postId = index+1;
                                print('/////////////////////');
                                print(AppData.instance.postId);
                                print('/////////////////////');
                                AppData.instance.fetchComments();
                                print(AppData.instance.observableCommentList);
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
          )
        ],
      ),
    );
  }
}
