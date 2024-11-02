import 'package:flutter/material.dart';
import 'package:social_media/api/api_service.dart';
import 'package:social_media/models/app_data.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/home_screen.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: AppBar(title: const Text('Comments'), centerTitle: true,),
        body: commentsLoading.value == true ? const Center(child: CircularProgressIndicator()) :
        //Obx(() =>
          Column(
            children: [
            Expanded(
              child: ListView.builder(
                itemCount: appData1.observableCommentList.length,                //AppData.instance.observableCommentList.length,
                itemBuilder: (context, index) {
                //return ApiServices().fetchCommentForPost(relatedPostId)
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: [
                          //       Text('Name : '),
                          //       Text(/*AppData.instance.observableCommentList[index].name.toString()*/     ),
                          //
                          //     ],
                          //   ),
                          // ),
                          Text('Name : ${appData1.observableCommentList[index].name.toString()}'),
                          Text('email : ${appData1.observableCommentList[index].email.toString()}'),
                          Text('Id : ${appData1.observableCommentList[index].id.toString()}'),
                          Text('postId : ${appData1.observableCommentList[index].postId.toString()}'),
                          Text('body : ${appData1.observableCommentList[index].body.toString()}')

                        ],
                      ),
                    ),
                  ),
                );
              },),
            )

          ],),
        //),

      ),
    );
  }
}
