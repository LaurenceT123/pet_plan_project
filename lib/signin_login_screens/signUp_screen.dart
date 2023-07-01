import 'package:flutter/material.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../main.dart';
import '../models/User.dart';

class MySignUpScreen extends StatefulWidget
{
  const MySignUpScreen({super.key, required this.title});
  final String title;

  @override
  State<MySignUpScreen> createState() => _MySignUpScreenState();
}

class _MySignUpScreenState extends State<MySignUpScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  User user = new User (imagePath: ' ', name: ' ', email: ' ');

  @override
  Widget build(BuildContext context)
  {


    goTo() {

      if(!nameController.text.isEmpty && !emailController.text.isEmpty) {

        user.setImagePath('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
        user.setName(nameController.text);
        user.setEmail(emailController.text);

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyPetProfiles_screen(user: user)),);
      }
      else
        {
          print("Try again, input email and name are required!");
        }

    }

    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // 'Welcome to Plan Pet'
            Expanded(
              flex:10,
              child: Text(
                'Enter Information',
                style: new TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ),

            Expanded(
              flex:90,
              child: Container(
                width: 350.0,
                child: Column(
                    children:
                    [
                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        controller:nameController,
                      ),

                      SizedBox(height:20),

                      TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        controller: emailController,
                      ),



                      SizedBox(height:20),

                      Container(
                        width:150.0,
                        child: OutlinedButton(
                          onPressed: goTo, //toDo
                          child: Text('Submit'),
                        ),

                      ),
                    ]
                ),
              ),
            ),


          ],
        ),
      ),
    );


  }
}
