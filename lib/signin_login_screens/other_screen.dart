import 'package:flutter/material.dart';
import '../main.dart';
import '../models/User.dart';
import '../models/Pet.dart';
import '../models/VetInfo.dart';
import '../signin_login_screens/createPet3_screen.dart';
import '../signin_login_screens/createPet2_screen.dart';

class MyOther_screen extends StatelessWidget
{
  final User user;
  final Pet pet;
  final VetInfo vet;

  final animalController = TextEditingController();

  MyOther_screen({super.key, required this.user, required this.pet, required this.vet});

  @override
  Widget build(BuildContext context)
  {

    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => const MyHomePage(title: 'Welcome to Pet Plan'),
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyCreatePetProfile2(user: user, pet:pet,vet: vet)));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),

          body:Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text('Sorry, it seems we don\'t have the animal of your choice listed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:20,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text('Please enter what animal you are planning for',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:20,
                      ),
                    ),

                    SizedBox(height: 20),

                    Container(
                      width: 350.0,
                      child: Column(
                          children:
                          [
                            TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: animalController,
                            ),

                          ]
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width:250.0,
                      child: OutlinedButton(
                        onPressed: () {
                          if (!animalController.text.isEmpty) {

                            pet.setAnimal(animalController.text);

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    MyCreatePetProfile3(
                                        user: user, pet: pet, vet: vet)),);
                          }
                        },
                        child: Text('Next'),
                      ),
                    ),



                  ]
              ),
            ),
          ),
    );
  }
}
