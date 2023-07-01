import 'package:flutter/material.dart';
import '../main.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import 'package:google_fonts/google_fonts.dart';
import '../signin_login_screens/petInfoDisplay.dart';

class MyCreatePetProfile4 extends StatelessWidget
{
  final User user;
  final Pet pet;

  const MyCreatePetProfile4({super.key, required this.user, required this.pet});



  /*Widget catProfiles()
  {


  }*/

  @override
  Widget build(BuildContext context)
  {

    Widget dogProfiles()
    {
      if(identical(pet.getAnimal(),'dog'))
      {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Dog Profile Pictures', style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 25)
                      )),
                    ),


                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://media.cnn.com/api/v1/images/stellar/prod/220818142713-dogs-tears-emotions-wellness-stock.jpg?c=16x9');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet)),);
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PetProfileWidget(
                              imagePath: 'https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg',
                              onClicked: () {
                                pet.setIndex(user.getNumberOfPets());
                                pet.setImagePath('https://people.com/thmb/SL7_3mF5irtEm4Kz8f63FWDrmPA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x0:1001x2)/dog-dating-1-a1a34ab3445740fcadf8699850c8333b.jpg');
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PetInfoDisplay(
                                        user: user, pet: pet)),);
                              },
                            ),
                          ),

                          PetProfileWidget(
                            imagePath: 'https://media.istockphoto.com/id/149425119/photo/german-shepherd-isolated-on-white.jpg?s=612x612&w=0&k=20&c=gvtU0eFUSEFh7BP6MUThYD754CTwiLkTz4ICQhWGgHU=',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://media.istockphoto.com/id/149425119/photo/german-shepherd-isolated-on-white.jpg?s=612x612&w=0&k=20&c=gvtU0eFUSEFh7BP6MUThYD754CTwiLkTz4ICQhWGgHU=');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet)),);
                            },
                          ),

                          SizedBox(width:10),
                        ]
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PetProfileWidget(
                            imagePath: 'https://previews.123rf.com/images/kirsanovv/kirsanovv0810/kirsanovv081000038/3693796-a-portrait-of-the-very-shaggy-small-dog-with-intent-look-profile.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://previews.123rf.com/images/kirsanovv/kirsanovv0810/kirsanovv081000038/3693796-a-portrait-of-the-very-shaggy-small-dog-with-intent-look-profile.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2BZZCOMpTJKljCt84bVU0ejbjG_NTDwYvY40i5HHaAbOOgZUHzryniPpwDHQJ8sftNIqpacetjRA&usqp=CAU&ec=48665698',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2BZZCOMpTJKljCt84bVU0ejbjG_NTDwYvY40i5HHaAbOOgZUHzryniPpwDHQJ8sftNIqpacetjRA&usqp=CAU&ec=48665698');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet)),);
                            },
                          ),

                          PetProfileWidget(
                            imagePath: 'https://people.com/thmb/WxJfkZ3MCkXFhY1GgWzuJLqDgDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(1019x626:1021x628)/dog-dating-2522ccf2b0e04f94a29f25fdb81d79af.jpg',
                            onClicked: () {
                              pet.setIndex(user.getNumberOfPets());
                              pet.setImagePath('https://people.com/thmb/WxJfkZ3MCkXFhY1GgWzuJLqDgDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(1019x626:1021x628)/dog-dating-2522ccf2b0e04f94a29f25fdb81d79af.jpg');
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => PetInfoDisplay(
                                      user: user, pet: pet)),);
                            },
                          ),
                        ]
                    ),


                  ]
              ),
            ),
          ),
        );
      }
      else
      {
        return SizedBox(height:0);
      }
    }

    Widget whichOne()
    {
      if(identical(pet.getAnimal(),'dog'))
      {
        return dogProfiles();
      }
      else
      {
        return SizedBox();
      }

    }


    final ScrollController _firstController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Profile Picture'),
      ),

      body: Column(
          children: [

           Expanded(flex: 60, child: whichOne()),

            Expanded(
              flex: 20,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: PetProfileWidget(
                  imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Photo-camera-in-circular-outlined-interface-button.svg/2048px-Photo-camera-in-circular-outlined-interface-button.svg.png',
                  onClicked: () {},
                ),
              ),
            ),
          ]
      ),
    );

  }
}
