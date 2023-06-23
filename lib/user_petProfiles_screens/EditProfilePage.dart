import 'package:flutter/material.dart';
import '../user_info/user_preferences.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../main.dart';
import 'petProfiles.dart';

void main() => runApp(MyEditProfile_screen(title: 'test'));

class MyEditProfile_screen extends StatefulWidget
{
  const MyEditProfile_screen({super.key, required this.title});
  final String title;

  @override
  State<MyEditProfile_screen> createState() => _EditProfileState();
}

class _EditProfileState extends State<MyEditProfile_screen> {

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
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Column(
          children:[

            Expanded(
              flex:50,
              child: ProfileWidget( //self-built profile widget, code located in profile_widget.dart
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async{}, //toDo
              ),

            ),

            Expanded(
              flex:50,
              child: Container(
                width: 350.0,
                child: Column(
                    children:
                    [
                      Text('Name:', textAlign: TextAlign.left),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: user.name,
                        ),
                      ),

                      SizedBox(height:10),

                      Text('Email:'),
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: user.email,
                        ),
                      ),
                      SizedBox(height:5),

                      Container(
                        margin: EdgeInsets.only(top:30,bottom: 10),
                        width: 200,
                        child: ElevatedButton(
                          child: Text('Change Password'),
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

                          Container(
                            width:150.0,
                            child:OutlinedButton(
                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPetProfiles_screen(title: 'test')),);},
                              child: Text('Save Changes'),
                            ),


                      ),
                    ]
                ),
              ),
            ),

          ]
        ),
    );
  }
}
