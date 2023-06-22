import 'package:flutter/material.dart';
import '../main.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../custom_made_widgets/petProfile_widget.dart';
import '../signin_login_screens/createPet4_screen.dart';

void main() => runApp(MyCreatePetProfile3(title: 'test'));

class MyCreatePetProfile3 extends StatefulWidget
{
  const MyCreatePetProfile3({super.key, required this.title});
  final String title;

  @override
  State<MyCreatePetProfile3> createState() => _MyCreatePetProfile3State();
}

class _MyCreatePetProfile3State extends State<MyCreatePetProfile3> {

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
          title: Text("Additional Information"),
        ),

        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
            // Name Input
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text("Name"),

                    SizedBox(
                      height: 30,
                      child: TextField(
                        obscureText: false,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Text("Medications"),

                    SizedBox(
                      height: 150,
                      child: TextField(
                        obscureText: false,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    Text("Additional Info"),

                    SizedBox(
                      height: 150,
                      child: TextField(
                        obscureText: false,
                        expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:30,bottom: 30),
                width: 200,
                child: ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCreatePetProfile4(title: 'test')),);},
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
