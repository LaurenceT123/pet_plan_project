import 'package:flutter/material.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class SharePetProfile extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  SharePetProfile({super.key, required this.user, required this.pet, required this.vet});


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Column(
            children: <Widget> [


              SizedBox(height:80),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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

                    SizedBox(height:60),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Column(
                            children: [
                              PetProfileWidget(
                                imagePath: 'https://vectorseek.com/wp-content/uploads/2021/02/Gmail-Logo-Vector.jpg',
                                onClicked: () {}
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Gmail', style: TextStyle(fontSize: 20,)),
                              ),
                            ],
                          ),

                        SizedBox(width: 60),

                        Column(
                          children: [
                            PetProfileWidget(
                                imagePath: 'https://static.vecteezy.com/system/resources/previews/004/879/666/original/chat-message-icon-on-a-white-background-free-vector.jpg',
                                onClicked: () {}
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Message', style: TextStyle(fontSize: 20,)),
                            ),

                          ],
                        ),

                      ],
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
