import 'package:flutter/material.dart';
import 'package:social_media/models/app_data.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('User Details'),),
      body: //Obx(() =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Obx(() => Column(
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
              Card(
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
          )
        ),
      )
      //),
    );
  }
}





























// import 'package:flutter/material.dart';
// import 'package:social_media/models/app_data.dart';
// import 'package:get/get.dart';
//
//
// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({super.key});
//
//   @override
//   State<UserProfileScreen> createState() => _UserProfileScreenState();
// }
//
// class _UserProfileScreenState extends State<UserProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('User Details'),),
//       body: Obx(() => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 60,),
//               Text('Name : ${AppData.instance.observableSingleUserList[0].name}'),
//               Text('Id : ${AppData.instance.observableSingleUserList[0].id}'),
//               Text('email : ${AppData.instance.observableSingleUserList[0].email}'),
//               Text('Phone : ${AppData.instance.observableSingleUserList[0].phone}'),
//               Text('UserName : ${AppData.instance.observableSingleUserList[0].username}'),
//               Text('Website : ${AppData.instance.observableSingleUserList[0].website}'),
//               Text('Company Name : ${AppData.instance.observableSingleUserList[0].company!.name}'),
//               Text('COMPANY'),
//               Text('Company BS : ${AppData.instance.observableSingleUserList[0].company!.bs}'),
//               Text('Company Catch Phrase : ${AppData.instance.observableSingleUserList[0].company!.catchPhrase}'),
//               Text('ADDRESS'),
//               Text('Street : ${AppData.instance.observableSingleUserList[0].address!.street}'),
//               Text('City : ${AppData.instance.observableSingleUserList[0].address!.city}'),
//               Text('Suite : ${AppData.instance.observableSingleUserList[0].address!.suite}'),
//               Text('Zip Code : ${AppData.instance.observableSingleUserList[0].address!.zipcode}'),
//             ],
//           ),
//         )
//       )
//     );
//   }
// }
