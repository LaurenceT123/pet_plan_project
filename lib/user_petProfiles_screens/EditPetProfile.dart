import 'package:flutter/material.dart';
import '../custom_made_widgets/profile_widget.dart';
import 'petProfiles.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class EditPetProfile extends StatelessWidget {

  final User user;
  final VetInfo vet;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  EditPetProfile({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Column(
          children: [

            Expanded(
              flex: 50,
              child: ProfileWidget( //self-built profile widget, code located in profile_widget.dart
                imagePath: 'https://static.hudl.com/users/prod/5499830_8e273ea3a64448478f1bb0af5152a4c7.jpg',
                isEdit: true,
                onClicked: () {}, //toDo
              ),

            ),

            Expanded(
              flex: 50,
              child: Container(
                width: 350.0,
                child: Column(
                    children:
                    [
                      Text('Name:', textAlign: TextAlign.left),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Change name',
                        ),
                        controller: nameController,
                      ),

                      SizedBox(height: 10),

                      Text('Email:'),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Change email',
                        ),
                        controller: emailController,
                      ),
                      SizedBox(height: 5),

                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        width: 200,
                        child: ElevatedButton(
                          child: Text('Change Phone Number'),
                          onPressed: () {
                            /*Navigator.push(context, MaterialPageRoute(builder: (
                                context) => const MyHomePage(title: 'test')),);*/
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                Colors.white), //font color
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue.shade200), //background color
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.blue.shade100)
                                )
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 150.0,
                        child: OutlinedButton(
                          onPressed: () {

                            if(!nameController.text.isEmpty) {
                              user.setName(nameController.text);
                            }
                            if(!emailController.text.isEmpty) {
                              user.setEmail(emailController.text);
                            }

                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPetProfiles_screen(user: user, vet:vet)),);
                          },
                          child: Text('Save Changes'),
                        ),


                      ),
                    ]
                ),
              ),
            ),

          ]
      ),
    );
  }

}