import 'package:flutter/material.dart';
import 'package:social_media/api/api_service.dart';
import 'package:social_media/models/app_data.dart';
import 'package:get/get.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Comments'),),
      body: Column(children: [
        Obx(() => Expanded(
          child: ListView.builder(
            itemCount: AppData.instance.observableCommentList.length,
            itemBuilder: (context, index) {
            //return ApiServices().fetchCommentForPost(relatedPostId)
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text('Name : '),
                            Text(AppData.instance.observableCommentList[index].name.toString()),

                          ],
                        ),
                      ),
                      Text('email : ${AppData.instance.observableCommentList[index].email.toString()}'),
                      Text('Id : ${AppData.instance.observableCommentList[index].id.toString()}'),
                      Text('postId : ${AppData.instance.observableCommentList[index].postId.toString()}'),
                      Text('body : ${AppData.instance.observableCommentList[index].body.toString()}')

                    ],
                  ),
                ),
              ),
            );
          },),
        )
        )
      ],),

    );
  }
}
