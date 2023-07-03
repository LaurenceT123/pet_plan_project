import 'package:flutter/material.dart';
import '../custom_made_widgets/profile_widget.dart';
import 'EditProfilePage.dart';
import '../signin_login_screens/createPetProfile_screen.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';
import '../user_petProfiles_screens/choosePetProfile.dart';
import '../signin_login_screens/showVetInfo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyPetProfiles_screen extends StatelessWidget
{

  final User user;
  final VetInfo vet;

  MyPetProfiles_screen({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          children: [

            Expanded(
              flex: 50,
              child: Column(
                  children: [
                    SizedBox(height: 100.0,),

                    ProfileWidget( //self-built profile widget, code located in profile_widget.dart
                      imagePath: 'https://static.hudl.com/users/prod/5499830_8e273ea3a64448478f1bb0af5152a4c7.jpg',
                      onClicked: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyEditProfile_screen(
                                user: user, vet:vet)),);
                      },
                    ),

                    Text(
                      'Welcome ' + user.getName(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),

                    Text(user.getEmail(),
                      style: TextStyle(fontSize: 25, color: Colors.grey),),
                    SizedBox(height: 40), //create space between title and widgets

                  ]
              ),
            ),


            Expanded(
              flex:20,
              child: Center(
                child: Column(
                  children: [


                    Text(user.getNumberOfPets().toString(), style: TextStyle(fontSize: 30, color: Colors.grey)),

                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Container(
                        width: 250,
                        height: 40,
                        child: ElevatedButton(
                          child: Text('Add New Pet Profile', style: TextStyle(fontSize: 20, color: Colors.white),),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MyCreatePetProfileScreen(user: user, vet: vet)),);
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            //font color
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue.shade200),
                            //background color
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: Colors.blue.shade100)
                                )
                            ),
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),

            SizedBox(height: 70),

            Expanded(
              flex:20,
              child: Column(
                children: [

                  Row(
                    children: [

                      Expanded(
                        flex: 30,
                        child: Icon(
                          Icons.pets,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),

                      Expanded(
                        flex:60,
                        child: Padding(
                          padding: const EdgeInsets.only(right:10),
                          child: Container(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              child: Text('View Pet Profiles', style: TextStyle(fontSize: 20, color: Colors.white),),
                              onPressed: () {
                                if(user.getNumberOfPets() != 0) {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          MyChoosePetProfile(user: user, vet:vet)),);
                                }
                                else
                                  {
                                    print("There are no Pet Profiles!");
                                  }
                              },
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                //font color
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade200),
                                //background color
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.blue.shade100)
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [

                      Expanded(
                        flex: 30,
                        child: Icon(
                          Icons.store,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),


                      Expanded(
                        flex: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0, right: 8),
                          child: SizedBox(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              child: Text('Vet Info', style: TextStyle(fontSize: 20, color: Colors.white),),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ShowVetInfo(user: user, vet:vet)),);
                              },
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                //font color
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blue.shade200),
                                //background color
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.blue.shade100)
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ]
      ),
    );

  }

}
