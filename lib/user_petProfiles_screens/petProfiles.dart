import 'package:flutter/material.dart';
import '../user_info/user_preferences.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../main.dart';
import 'EditProfilePage.dart';
import '../signin_login_screens/createPetProfile_screen.dart';
import '../custom_made_widgets/petProfile_widget.dart';

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
        body: Column(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:35),
                  ),
                ]
              ),
            ),

            Expanded(
              flex: 50,
              child: Column(
                children: [

                  Text('PET PROFILES', style: TextStyle(fontSize:25, color: Colors.grey),),
                  SizedBox(height: 40), //create space between title and widgets

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        direction: Axis.vertical,
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                            PetProfileWidget(
                              imagePath: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                              onClicked:(){},
                            ),

                            //Add Pet Profile
                            PetProfileWidget(
                              imagePath: 'https://pixlok.com/wp-content/uploads/2021/12/Add-Icon-SVG-98ygj.png',
                              onClicked:() {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCreatePetProfileScreen(title: 'test')),);},
                            ),
                        ]
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top:30,bottom: 30),
              width: 200,
              child: ElevatedButton(
                child: Text('Logout'),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'test')),);},
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
    );
  }
}
