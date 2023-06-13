import 'package:flutter/material.dart';
import '../user_info/user_preferences.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../dailySchedule_screens/dailySchedule.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyPetProfiles_screen(title: 'test'));
}
class MyPetProfiles_screen extends StatefulWidget
{
  const MyPetProfiles_screen({super.key, required this.title});
  final String title;

  @override
  State<MyPetProfiles_screen> createState() => _petProfileState();
}

class _petProfileState extends State<MyPetProfiles_screen> {

  @override
  Widget build(BuildContext context)
  {

    final user = UserPreferences.myUser;

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
        body: Center(
        child:Column(
          children: [

            Expanded(
              flex:40,
              child: Column(
                children: [
                  SizedBox(height:100.0,),

                  ProfileWidget( //self-built profile widget, code located in profile_widget.dart
                    imagePath: user.imagePath,
                    onClicked: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyEditProfile_screen(title: 'test')),);
                    },
                  ),

                  Text(
                    'Welcome ' + user.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:30),
                  ),
                ]
              ),
            ),

            Expanded(
              flex: 10,
              child: Container (
                child:Text(
                'PET PROFILES',
                style: TextStyle(fontSize:20, color: Colors.grey),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top:30,bottom: 30),
              width: 200,
              child: ElevatedButton(
                child: Text('Daily Schedule'),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDailySchedule_screen(title: 'test')),);},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white), //font color
                  backgroundColor: MaterialStateProperty.all(Colors.blue.shade200), //background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue.shade100)
                      )
                  ),
                ),
              ),
            ),


          ]
        ),

        ),
    );
  }
}
