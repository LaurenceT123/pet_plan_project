import 'package:flutter/material.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../user_petProfiles_screens/petProfiles2.dart';
import '../user_petProfiles_screens/EditPetProfile2.dart';
import '../custom_made_widgets/petProfile_widget.dart';

import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class EditPetProfile extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  EditPetProfile({super.key, required this.user, required this.pet, required this.vet});


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyPetProfiles2_screen(user: user,vet:vet, pet:pet)));

                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditPetProfile2(user: user,vet:vet,pet:pet)));

              },
            ),

            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                user.removePet(pet);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyPetProfiles_screen(user: user,vet:vet)));

              },
            ),
          ]
      ),

      body: SingleChildScrollView(
        child: Column(
            children: <Widget> [

              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PetProfileWidget(
                      imagePath: pet.getImagePath(),
                      file: pet.getFile(),
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

                    SizedBox(height:60),

                    Container (
                      child: Column(
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text('Medications',
                                  style: TextStyle(fontSize: 20, color: Colors.black)),
                            ),

                            Text(pet.getMedications(),
                                style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),


                    SizedBox(height:60),

                    Container (
                      child: Column(
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text('Additional Info',
                                  style: TextStyle(fontSize: 20, color: Colors.black)),
                            ),

                            Text(pet.getAdditionalInfo(),
                                style: TextStyle(fontSize: 15)),
                          ]
                      ),
                    ),

                    SizedBox(height:60),
                  ]
              ),

            ]
        ),
      ),
    );
  }
}
