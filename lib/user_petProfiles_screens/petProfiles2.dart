import 'package:flutter/material.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../pet_profiles_info/pet_preferences.dart';
import '../dailySchedule_screens/dailySchedule.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyPetProfiles2_screen(title: 'test'));
}
class MyPetProfiles2_screen extends StatefulWidget
{
  const MyPetProfiles2_screen({super.key, required this.title});
  final String title;

  @override
  State<MyPetProfiles2_screen> createState() => _petProfile2State();
}

class _petProfile2State extends State<MyPetProfiles2_screen> {

  @override
  Widget build(BuildContext context)
  {

    final user = PetPreferences.myUser;

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
      ),
      body: Column(
          children: [

            Expanded(
              flex:30,
              child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PetProfileWidget(
                        imagePath: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                        onClicked:(){},
                      ),
                    ),

                    Text(user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize:35),
                    ),
                  ]
              ),
            ),

            Expanded(
              flex:40,
              child: Column(
                  children: [


                  ]
              ),
            ),

            Expanded(
              flex: 30,
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.only(top:2,bottom: 2),
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Daily Schedule'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDailySchedule_screen(title: 'test')),);},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                        backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.blue.shade100)
                            )
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:2,bottom: 2),
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Vet Appointment'),
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                        backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.blue.shade100)
                            )
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top:2,bottom: 2),
                    width: 300,
                    child: ElevatedButton(
                      child: Text('Share Pet Profile'),
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                        backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.blue.shade100)
                            )
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),



          ]
      ),
    );
  }
}
