import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import 'petProfiles.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class MyEditProfile_screen extends StatelessWidget {

  final User user;
  final VetInfo vet;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  MyEditProfile_screen({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [

              SizedBox(height: 30),

              PetProfileWidget( //self-built profile widget
                imagePath: 'https://static.hudl.com/users/prod/5499830_8e273ea3a64448478f1bb0af5152a4c7.jpg',
                onClicked: () {}, //toDo
              ),

              SizedBox(height: 80),
              Container(
                width: 350.0,
                child: Column(
                    children:
                    [
                      Text('Name:', textAlign: TextAlign.left),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: user.getName(),
                        ),
                        controller: nameController,
                      ),

                      SizedBox(height: 10),

                      Text('Email:'),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: user.getEmail(),
                        ),
                        controller: emailController,
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          width:380,
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              labelText: user.getNumber(),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (phone)
                            {
                              phoneController.text = phone.completeNumber;
                            },

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
                            if(!phoneController.text.isEmpty)
                              {
                                user.setNumber(phoneController.text);
                              }

                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyPetProfiles_screen(user: user, vet:vet)),);
                          },
                          child: Text('Save Changes'),
                        ),


                      ),
                    ]
                ),
              ),

            ]
        ),
      ),
    );
  }

}