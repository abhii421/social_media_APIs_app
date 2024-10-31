import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/exceptions/app_exceptions.dart';
import 'package:social_media/models/comment_model.dart';
import 'package:social_media/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:social_media/models/user_model.dart';

final dio = Dio();
final baseUrl = 'https://jsonplaceholder.typicode.com';



class ApiServices{

      Future<List<PostModel>> getPosts() async{
            List<PostModel> postList = [];
            final response = await dio.get('$baseUrl/posts');

            if(response.statusCode == 200 || response.statusCode == 201) {
                  for (Map<String, dynamic> i in response.data) {
                        postList.add(PostModel.fromJson(i));
                  }

                  //print(postList);
                  return postList;
            } else if(response.statusCode == 404){
                  throw AppExceptions('The data you requested was not found');

            }
            else if(response.statusCode == 400){
                  throw AppExceptions('The request made was not correct');
            }
            else if(response.statusCode == 401){
                  throw AppExceptions('It is an unauthorised request');
            }
                  else{
                  throw AppExceptions('Something went wrong!');
            }
      }



      Future<Map<String, dynamic>> giveResponseAfterPosting(Map<String, dynamic> postData) async{
                  final response = await dio.post('$baseUrl/posts', data: postData);

                  if(response.statusCode == 200 || response.statusCode == 201) {
                        //print(response.data);
                        //response.data[];
                        return response.data;

                  }else if(response.statusCode == 404){
                        throw AppExceptions('The data you requested was not found');

                  }
                  else if(response.statusCode == 400){
                        throw AppExceptions('The request made was not correct');
                  }
                  else if(response.statusCode == 401){
                        throw AppExceptions('It is an unauthorised request');
                  }
                  else{
                        throw AppExceptions('Something went wrong!');
                  }
      }


      //Future<List<>>
      //While fetching comments, we never have to fetch the entire comment list, only fetching the comment of that
      //particular post, which will be received by the function

      Future<List<CommentModel>> fetchCommentForPost(int relatedPostId) async{

            List<CommentModel> commentListForIndividualPost = [];
            final response = await dio.get('$baseUrl/comments/?postId=$relatedPostId');
            // print('\n');
            // print(response.data);
            // print('\n');
            //
            // print('&&&&&&&&&');
            // print(relatedPostId);

            if(response.statusCode == 200 ||response.statusCode == 201){
                  for(Map<String, dynamic> i in response.data){
                        commentListForIndividualPost.add(CommentModel.fromJson(i));
                  }
                  //print(response.data);
                  return commentListForIndividualPost;
            }else if(response.statusCode == 404){
                  throw AppExceptions('The data you requested was not found');

            }
            else if(response.statusCode == 400){
                  throw AppExceptions('The request made was not correct');
            }
            else if(response.statusCode == 401){
                  throw AppExceptions('It is an unauthorised request');
            }
            else{
                  throw AppExceptions('Something went wrong!');
            }
      }




      Future<List<UserModel>> fetchUser(int userId) async{
            var response = await dio.get('$baseUrl/users/?id=$userId');
            List<UserModel> listOfSingleUser = [];

            if(response.statusCode == 200 ||response.statusCode == 201){

                  for(Map<String, dynamic> i in response.data){
                        listOfSingleUser.add(UserModel.fromJson(i));
                        //print(listOfSingleUser);
                  }

                        return listOfSingleUser;
                  // print(response.data);
                  // print('**********************');
                  // print(UserModel.fromJson(response.data));
                  //Map<String, dynamic> userMap = UserModel.fromJson(response.data);
            }else if(response.statusCode == 404){
                  throw AppExceptions('The data you requested was not found');

            }
            else if(response.statusCode == 400){
                  throw AppExceptions('The request made was not correct');
            }
            else if(response.statusCode == 401){
                  throw AppExceptions('It is an unauthorised request');
            }
            else{
                  throw AppExceptions('Something went wrong!');
            }

      }




}

//This was the api to get all the posts -- "https://jsonplaceholder.typicode.com/posts"
//A query parameter at the end yielded posts or maps only which has userId as 1 just like below
//https://jsonplaceholder.typicode.com/posts?userId=1


//Below is one of the posts when the query was applied for title
//The query was "https://jsonplaceholder.typicode.com/posts?title=nesciunt quas odio"


//{
//         "userId": 1,
//         "id": 5,
//         "title": "nesciunt quas odio",
//         "body": "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
//     }

//https://jsonplaceholder.typicode.com/posts/?id=1
//using above query, we can filter post with id = 1, there will be only 1 post with id = 1, there are 100 such posts
//so the query can go upto id=100

//example response --

// [
//     {
//         "userId": 6,
//         "id": 51,
//         "title": "soluta aliquam aperiam consequatur illo quis voluptas",
//         "body": "sunt dolores aut doloribus\ndolore doloribus voluptates tempora et\ndoloremque et quo\ncum asperiores sit consectetur dolorem"
//     }
// ]

