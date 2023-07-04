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

              Padding(
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


            ]
        ),
      ),
    );
  }
}
