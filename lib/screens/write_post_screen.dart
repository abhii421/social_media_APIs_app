import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media/models/app_data.dart';

class WritePostScreen extends StatefulWidget {
  const WritePostScreen({super.key});

  @override
  State<WritePostScreen> createState() => _WritePostScreenState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController bodyController = TextEditingController();
TextEditingController titleController = TextEditingController();
TextEditingController userIdController = TextEditingController();


class _WritePostScreenState extends State<WritePostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    bodyController.clear();
    titleController.clear();
    userIdController.clear();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
          const SizedBox(height: 50,),
        Form(
            key: _formKey,
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextFormField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Enter a title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Input a proper Title';
                  }

                  return null;
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextFormField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                //This code will 100% ensure that in any type of keyboard only numbers can be entered
                //When no wrong input occurs, I can easily parse the String received via userIdController
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'Enter your User ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  // if(value!=null || !value.isEmpty){
                  //   int parsedInteger = int.tryParse(value)!;
                  // }

                  // if (value == null || value.isEmpty || value != '1' || value != '2' || value != 3 || value != 4 || value != 5 || value != 6 || value != 7 || value != 8 || value != 9 || value != 10 ) {
                  //   return 'Invalid ID, only ID from 1 to 10';
                  // }

                  //int parsedInteger = int.tryParse(source)


                  if(value==null|| value.isEmpty){
                    return 'Invalid ID';
                  }

                  if(int.tryParse(value)!>10 || int.tryParse(value)==0|| int.tryParse(value)!<0){
                    return 'Invalid ID, only ID from 1 to 10';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextFormField(
                controller: bodyController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Enter a body',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Input a proper body';
                  }

                  return null;
                },
              ),
            )
          ],
        )),
          ElevatedButton(onPressed: () async{
            // print('///////////////');
            // print(userIdController.text);
            // print(titleController.text);
            // print(bodyController.text);


            if (_formKey.currentState?.validate() ?? false) {
              //print('**********Entered the if block******************');
              String userIdController1 = userIdController.text;
              String titleController1 = titleController.text;
              String bodyController1 = bodyController.text;

              int userIdInteger = int.tryParse(userIdController1)!;
              // AppData.instance.newPostMap = {
              //   'User ID' : userIdController1,
              //   'Title' : titleController1,
              //   'Body' : bodyController1,
              // };

              //AppData.instance.sendMapToPost();



              Map<String, dynamic> postDataToBeGivenToAppDataSingleTonClass = {
                  'userId' : userIdInteger,
                  'title' : titleController1,
                  'body' : bodyController1,
              };
              await AppData.instance.createPost(postDataToBeGivenToAppDataSingleTonClass);

              Navigator.of(context).pop();

            }


            // if(_formKey.currentState!.validate() == false){
            //   print('something wrong with the form');
            // }
            },
              child: const Text('Upload'))
            ],
        ),
    );
  }
  }
