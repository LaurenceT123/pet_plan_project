import 'package:flutter/material.dart';
import '../main.dart';
import 'other_screen.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';
import '../signin_login_screens/createPet3_screen.dart';

class MyCreatePetProfile2 extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  const MyCreatePetProfile2({super.key, required this.user, required this.pet, required this.vet});

  @override
  Widget build(BuildContext context)
  {
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
                  background: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGPBoEGpVK4HkV3wXaCeWpIfSkwNFRX43_3nAfhGpcSlo9dTQD1_ObEHTJycit7dTnbtpqnFSiA_g&usqp=CAU&ec=48665698', fit: BoxFit.cover),
                  title: Text('Create Your New Pet Profile!'),
                ),
              ),
            ];
          },


          body:Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'What Pet Are You Planning For?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:35,
                      ),
                    ),
                  ),

                  //Reptiles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap:(){
                          pet.setAnimal("reptile");

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  MyCreatePetProfile3(user: user, pet: pet, vet:vet)),);
                        },
                        child: Ink.image(
                          image: NetworkImage('https://media.istockphoto.com/id/1038723210/photo/turtle-isolated-on-white-background-reptile-species-or-tortoise.jpg?s=170667a&w=0&k=20&c=-e6QKQfzXPON9i2InHjCJD4m0S06ATsT61gcFomeT-E='),
                          width: 250,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height:20),

                  //Fish and Rodents
                  InkWell(
                    onTap:(){
                      pet.setAnimal("fish");

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              MyCreatePetProfile3(user: user, pet: pet, vet:vet)),);
                    }, //todo
                    child: Ink.image(
                      image: NetworkImage('https://previews.123rf.com/images/mirekkijewski/mirekkijewski1406/mirekkijewski140600157/29583600-goldfish-group-of-fish-on-a-white-background.jpg'),
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),

                      //Space between
                  SizedBox(height:20),

                  InkWell(
                      onTap:(){
                        pet.setAnimal("rodent");

                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                MyCreatePetProfile3(user: user, pet: pet,vet:vet)),);

                      }, //todo
                      child: Ink.image(
                        image: NetworkImage('https://www.wellnessvet.com.hk/wp-content/webpc-passthru.php?src=https://www.wellnessvet.com.hk/wp-content/uploads/2021/12/guinea-pig_1.jpg&nocache=1'),
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20),
                    child:SizedBox(
                      width:250.0,
                      child: OutlinedButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyOther_screen(title: 'test')),);},
                        child: Text('Other'),
                      ),
                    ),
                  ),

                ]
            ),
          ),
        )
    );
  }
}
