import 'package:flutter/material.dart';
import 'package:social_media/api/api_service.dart';
//import 'package:social_media/models/app_data.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/home_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    appData1.observableSingleUserList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
       Scaffold(
        appBar: AppBar(title: const Text('User Details'),),
        body: //Obx(() =>
          userListLoading.value == true ? Center(child: CircularProgressIndicator()) :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: /*Obx(() =>*/ Column(
              children: [
                const SizedBox(height: 30),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name : ${appData1.observableSingleUserList[0].name}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Id : ${appData1.observableSingleUserList[0].id}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Email : ${appData1.observableSingleUserList[0].email}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone : ${appData1.observableSingleUserList[0].phone}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Username : ${appData1.observableSingleUserList[0].username}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Website : ${appData1.observableSingleUserList[0].website}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Company Name : ${appData1.observableSingleUserList[0].company!.name}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('COMPANY'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Company BS : ${appData1.observableSingleUserList[0].company!.bs}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Company Catch Phrase : ${appData1.observableSingleUserList[0].company!.catchPhrase}'),
                  ),
                ),
                const Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ADDRESS'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Street : ${appData1.observableSingleUserList[0].address!.street}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('City : ${appData1.observableSingleUserList[0].address!.city}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Suite : ${appData1.observableSingleUserList[0].address!.suite}'),
                  ),
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Zip Code : ${appData1.observableSingleUserList[0].address!.zipcode}'),
                  ),
                ),
              ],
            ),
            //)
          ),
        )
        //),
      ),
    );
  }
}