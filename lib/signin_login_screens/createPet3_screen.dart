import 'package:flutter/material.dart';
import '../signin_login_screens/createPet4_screen.dart';

import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

import '../custom_made_widgets/input_field.dart';

class MyCreatePetProfile3 extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  MyCreatePetProfile3({super.key, required this.user, required this.pet, required this.vet});


  final nameController = TextEditingController();
  final medicationsController = TextEditingController();
  final additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar: AppBar(
          title: Text("Additional Information"),
        ),

        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
              // Name Input
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right:8, top:8),
                  child: MyInputField(title: 'Name', hint: 'Enter name', controller: nameController),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Medications"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    child: TextField(
                      obscureText: false,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: medicationsController,
                    ),
                  ),
                ),

                Text("Additional Info"),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    child: TextField(
                      obscureText: false,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: additionalInfoController,
                    ),
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

                        if(!medicationsController.text.isEmpty)
                          {
                            pet.setMedications(medicationsController.text);
                          }
                        if(!additionalInfoController.text.isEmpty)
                        {
                          pet.setAdditionalInfo(additionalInfoController.text);
                        }

                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyCreatePetProfile4(
                                user: user, pet: pet, vet: vet)),);
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
        ),
    );
  }
}
