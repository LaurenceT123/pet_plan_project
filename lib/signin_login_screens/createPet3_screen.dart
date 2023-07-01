import 'package:flutter/material.dart';
import '../main.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../signin_login_screens/createPet4_screen.dart';

import '../models/Pet.dart';
import '../models/User.dart';

import '../custom_made_widgets/input_field.dart';

class MyCreatePetProfile3 extends StatelessWidget
{
  final User user;
  final Pet pet;

  MyCreatePetProfile3({super.key, required this.user, required this.pet});


  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar: AppBar(
          title: Text("Additional Information"),
        ),

        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
            // Name Input
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [

                    MyInputField(title: 'Name', hint: 'Enter name', controller: nameController),

                    Text("Medications"),

                    SizedBox(
                      height: 150,
                      child: TextField(
                        obscureText: false,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Text("Additional Info"),

                    SizedBox(
                      height: 150,
                      child: TextField(
                        obscureText: false,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:30,bottom: 30),
                width: 200,
                child: ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {

                    if(!nameController.text.isEmpty) {

                      pet.setName(nameController.text);

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyCreatePetProfile4(
                              user: user, pet: pet)),);
                     }


                    },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                    backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue.shade100)
                        )
                    ),
                  ),
                ),
              ),

          ]
        ),
    );
  }
}
