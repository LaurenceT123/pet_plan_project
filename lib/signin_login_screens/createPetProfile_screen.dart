import 'package:flutter/material.dart';
import 'createPet2_screen.dart';
import 'createPet3_screen.dart';
import '../models/User.dart';
import '../models/Pet.dart';
import '../models/VetInfo.dart';

class MyCreatePetProfileScreen extends StatelessWidget{

  final User user;
  final VetInfo vet;

  MyCreatePetProfileScreen({super.key, required this.user, required this.vet});

  Pet newPet = new Pet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const <StretchMode>[
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                  //centerTitle:true,
                  background: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGPBoEGpVK4HkV3wXaCeWpIfSkwNFRX43_3nAfhGpcSlo9dTQD1_ObEHTJycit7dTnbtpqnFSiA_g&usqp=CAU&ec=48665698',
                      fit: BoxFit.cover),
                  title: Text('Create Your New Pet Profile!'),
                ),
              ),
            ];
          },


          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'What Pet Are You Planning For?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),

                  //Bird
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                          newPet.setAnimal("bird");

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                              MyCreatePetProfile3(user: user, pet: newPet, vet: vet)),);
                        },
                        child: Ink.image(
                          image: NetworkImage(
                              'https://photosfine.files.wordpress.com/2012/04/green-bird-white-background.jpg'),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  //Dog and Cat
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {

                          newPet.setAnimal("dog");

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  MyCreatePetProfile3(user: user, pet: newPet, vet: vet)),);
                        },
                        child: Ink.image(
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/fc/a3/f2/fca3f23718eb4a50cbe140c3d02409f1.jpg'),
                          width: 200,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),

                      InkWell(
                        onTap: () {

                          newPet.setAnimal("cat");

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                              MyCreatePetProfile3(user: user, pet: newPet, vet: vet)),);
                        },
                        child: Ink.image(
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/7a/9d/0d/7a9d0d3e2678927b6d1994d9b078030b.png'),
                          width: 170,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  //Button for Other
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          width: 250.0,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                  MyCreatePetProfile2(user: user, vet: vet, pet : newPet)),);
                            },
                            child: Text('Other'),
                          ),
                        ),
                      ),
                    ],
                  ),


                ]
            ),
          ),
        )
    );
  }
}
