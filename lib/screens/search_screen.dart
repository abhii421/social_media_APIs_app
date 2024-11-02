import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/screens/home_screen.dart';
import 'package:social_media/screens/search_screen_results.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

//int enteredUserId = 1;
TextEditingController searchTextController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 12, right: 12, bottom: 10),
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: searchTextController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: 'Input the User ID (only integers)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
              onPressed: () {

                if(searchTextController!=null) {
                  appData1.searchUserFunction(int.tryParse(searchTextController.text) ?? 1);
                }

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return const SearchScreenResults();
                // },));

              }, child: const Text('Search')),


          Obx(() => Expanded(
            child: ListView.builder(
              itemCount: appData1.observableSearchedUsersList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(appData1.observableSearchedUsersList[index].name.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('Id : ${appData1.observableSearchedUsersList[index].id}'),
                          Text('Email : ${appData1.observableSearchedUsersList[index].email}'),
                          Text('Phone : ${appData1.observableSearchedUsersList[index].phone}'),
                          Text('Username : ${appData1.observableSearchedUsersList[index].username}'),
                          Text('Website : ${appData1.observableSearchedUsersList[index].website}'),
                          Text('Company Name : ${appData1.observableSearchedUsersList[index].company!.name}'),

                        ],
                      ),
                    ),
                  ),
                );
              },),
          ),)


        ],
      ),
    );
  }
}
