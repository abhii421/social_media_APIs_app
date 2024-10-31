import 'package:flutter/material.dart';
import 'package:social_media/models/app_data.dart';
import 'package:get/get.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details'),),
      body: Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 60,),
              Text('Name : ${AppData.instance.observableSingleUserList[0].name}'),
              Text('Id : ${AppData.instance.observableSingleUserList[0].id}'),
              Text('email : ${AppData.instance.observableSingleUserList[0].email}'),
              Text('Phone : ${AppData.instance.observableSingleUserList[0].phone}'),
              Text('UserName : ${AppData.instance.observableSingleUserList[0].username}'),
              Text('Website : ${AppData.instance.observableSingleUserList[0].website}'),
              Text('Company Name : ${AppData.instance.observableSingleUserList[0].company!.name}'),
              Text('COMPANY'),
              Text('Company BS : ${AppData.instance.observableSingleUserList[0].company!.bs}'),
              Text('Company Catch Phrase : ${AppData.instance.observableSingleUserList[0].company!.catchPhrase}'),
              Text('ADDRESS'),
              Text('Street : ${AppData.instance.observableSingleUserList[0].address!.street}'),
              Text('City : ${AppData.instance.observableSingleUserList[0].address!.city}'),
              Text('Suite : ${AppData.instance.observableSingleUserList[0].address!.suite}'),
              Text('Zip Code : ${AppData.instance.observableSingleUserList[0].address!.zipcode}'),
            ],
          ),
        )
      )
    );
  }
}
