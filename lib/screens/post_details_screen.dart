import 'package:flutter/material.dart';
import 'package:social_media/api/api_service.dart';
import 'package:social_media/models/app_data.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: AppData.instance.observableCommentList.length,
            itemBuilder: (context, index) {
            //return ApiServices().fetchCommentForPost(relatedPostId)
            return Card(
              child: Column(
                children: [
                  Text(AppData.instance.observableCommentList[index].name.toString()),
                ],
              ),
            );
          },),
        )
      ],),

    );
  }
}
