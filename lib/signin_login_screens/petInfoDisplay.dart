import 'package:flutter/material.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../custom_made_widgets/petProfile_widget.dart';

import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class PetInfoDisplay extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  PetInfoDisplay({super.key, required this.user, required this.pet, required this.vet});


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

            Expanded(
              flex: 30,
              child: Column(
                  children: [
                    PetProfileWidget(
                      imagePath: pet.getImagePath(),
                      onClicked: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => PetInfoDisplay(
                        user: user, pet: pet)),);*/
                      },
                    ),

                    Text(pet.getName(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),),

                    Text(pet.getAnimal(),
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                  ]
              ),
            ),

            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.all(60),
                child: SizedBox(
                  width: 250.0,
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {

                      user.addPet(pet);

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              MyPetProfiles_screen(user: user, vet:vet)),);
                    },
                    child: Text('Finish', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),

            ),


          ]
      ),
    );
  }
}
