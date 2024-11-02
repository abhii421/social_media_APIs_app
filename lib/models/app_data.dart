import 'package:get/get.dart';
import 'package:social_media/models/comment_model.dart';
import 'package:social_media/models/user_model.dart';
import 'post_model.dart';
import 'package:social_media/api/api_service.dart';
import 'package:social_media/exceptions/app_exceptions.dart';

class AppData extends GetxController{

  AppData._privateConstructor();

  static final AppData instance = AppData._privateConstructor();
  //I have created a single instance of AppData class to be accessed later on when getting data
  final ApiServices apiServicesInstance = ApiServices();




  final RxList<PostModel> observablePostsList = <PostModel>[].obs;

  Future<void> fetchPosts() async{

    List<PostModel> postList = await apiServicesInstance.getPosts();
    observablePostsList.assignAll(postList);

    //assignPosts(postList);
//I have got the list from the apiServices, stored it in a list,(postList) assigned it/equalled it/gave it to another list which is observable now.
    //This observable list is the one being used in homepage.dart i.e. it is under observation.
    //Whenever there's a change in such a list, this list under observation will come to be known by Obx in the homepage.dart
    //The homepage containing all the posts will get updated.
//This assignAll function simply updates our main observable list OR assigns all the values from List obtained via apiServices to observablePosts


    //This could have been done like this too -
    //Future<void> fetchPosts() async {
    // observablePosts.value = await _apiService.fetchPosts();
    //on the LHS, there is basically assigning being done like .. a = 2; a is assigned the value of 2
    //Similarly, observablePosts is assigned the value obtained from "_apiService.fetchPosts()"

    //Say, List a1 =[]; b1 = ['Tom', 'Harry']; updating it ->  a1 = b1. We assigned the value of b1 to a1. or we updated value of a1
    //Similarly, a1.assignAll(b1);      a1 is assigned all the values of b1





    //Ultimately the data coming from apiServices is under observation now and homepage will change when a change occurs.
  }



  //int postId = 1;
  final RxList<CommentModel> observableCommentList = <CommentModel>[].obs;

  Future<void> fetchComments(int postId) async{
    observableCommentList.clear();

    //final apiServices = ApiServices();
    List<CommentModel> fetchedCommentsList = await apiServicesInstance.fetchCommentForPost(postId);
    observableCommentList.assignAll(fetchedCommentsList);
    // commentsLoading.value = false;
    // print(commentsLoading.value);
  }




  //int userId = 1;
  final RxList<UserModel> observableSingleUserList = <UserModel>[].obs;

  Future<void> fetchUserData(int userId) async{
    observableSingleUserList.clear();
    List<UserModel> fetchedUserList = await apiServicesInstance.fetchUser(userId);
    observableSingleUserList.assignAll(fetchedUserList);
    //userListLoading.value = false;

  }


  final RxList<UserModel> observableSearchedUsersList = <UserModel>[].obs;

  Future<void> searchUserFunction (int userId) async{
    observableSearchedUsersList.clear();
    List<UserModel> fetchedSearchedUserList = await apiServicesInstance.searchAndReturnUser(userId);
    observableSearchedUsersList.assignAll(fetchedSearchedUserList);
  }


  Future<void> createPost (Map<String, dynamic> postData)async{
    final response = await apiServicesInstance.giveResponseAfterPosting(postData);
    observablePostsList.add(PostModel.fromJson(response));
  }


}