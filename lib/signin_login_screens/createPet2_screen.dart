import 'package:flutter/material.dart';
import 'other_screen.dart';
import '../signin_login_screens/createPet3_screen.dart';
import '../signin_login_screens/createPetProfile_screen.dart';
import '../models/Pet.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

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
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyCreatePetProfileScreen(user: user,vet: vet)));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),


          body:SingleChildScrollView(
            child: Center(
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
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2JGr_SrMAEViTKR9FU8AAMznBKlKro-9-_Q&usqp=CAU'),
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
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyOther_screen(user:user, pet:pet, vet:vet)),);},
                          child: Text('Other'),
                        ),
                      ),
                    ),

                  ]
              ),
            ),
          ),
    );
  }
}
