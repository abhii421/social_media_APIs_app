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


  void assignPosts(List<PostModel> postsList)async{
    observablePosts.assignAll(postsList);
  }


  Future<void> fetchPosts() async{
    //final apiService = ApiServices();

    List<PostModel> postList = await apiServicesInstance.getPosts();
    assignPosts(postList);
    //I have got the list from the apiServices, stored it in a list,(postList) assigned it to another list which is observable now.
    //Ultimately the data coming from apiServices is under observation now and will change when a change occurs.
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










  int postId = 1;
  final RxList<CommentModel> observableCommentList = <CommentModel>[].obs;

  Future<void> fetchComments() async{
    //print('function called');
    final apiServices = ApiServices();
    //print(postId);
    List<CommentModel> commentList1 = await apiServices.fetchCommentForPost(postId);
    // print('***********');
    // print(postId);
    // print('***********');
    observableCommentList.assignAll(commentList1);

  }


  // var selectedUser = Rx<UserModel>.;


  int userId = 1;
  final RxList<UserModel> observableSingleUserList = <UserModel>[].obs;

  Future<void> fetchUserData() async{
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