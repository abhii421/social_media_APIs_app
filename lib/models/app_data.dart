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

  final RxList<PostModel> observablePosts = <PostModel>[].obs;
  final ApiServices apiServicesInstance = ApiServices();


  void assignPosts(List<PostModel> postsList) async{
    observablePosts.assignAll(postsList);
  }


  Future<void> fetchPosts() async{
    //final apiService = ApiServices();

    List<PostModel> postList = await apiServicesInstance.getPosts();
    assignPosts(postList);
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




  Future<void> createPost (Map<String, dynamic> postData)async{


    final response = await apiServicesInstance.giveResponseAfterPosting(postData);
    print(response);

    //print(response);
    // <PostModel> newPostForAddition = {
    //
    // };
    //response[userId]


    // Iterable<MapEntry<String, dynamic>> listOfMapEntry = response.entries;
    //
    // listOfMapEn
    observablePosts.add(PostModel.fromJson(response));


  }










  //int postId = 1;
  final RxList<CommentModel> observableCommentList = <CommentModel>[].obs;

  Future<void> fetchComments(int postId) async{
    observableCommentList.clear();

    final apiServices = ApiServices();

    List<CommentModel> commentListFromApiServices = await apiServices.fetchCommentForPost(postId);

    observableCommentList.assignAll(commentListFromApiServices);

  }


  // var selectedUser = Rx<UserModel>.;


  int userId = 1;
  final RxList<UserModel> observableSingleUserList = <UserModel>[].obs;

  Future<void> fetchUserData() async{
    observableSingleUserList.clear();
    final apiServices = ApiServices();
    List<UserModel> userList1 = await apiServices.fetchUser(userId);
    observableSingleUserList.assignAll(userList1);
  }







  // Map<String, dynamic> newPostMap(){
  //
  //
  // }

  //  Map<String, dynamic> newPostMap = {};
  //
  // void sendMapToPost(){
  //   print(newPostMap);
  // }


}