import 'package:flutter/material.dart';
import '../models/User.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../signin_login_screens/getVetInfo.dart';

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
  final phoneController = TextEditingController();
  User user = new User (imagePath: ' ', name: ' ', email: ' ');

  @override
  Widget build(BuildContext context)
  {


    goTo() {

      if(!nameController.text.isEmpty && !emailController.text.isEmpty && !phoneController.text.isEmpty) {

        user.setImagePath('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
        user.setName(nameController.text);
        user.setEmail(emailController.text);
        user.setNumber(phoneController.text);

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => GetVetInfo(user: user),));
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
                      Container(
                        width:380,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          controller:nameController,
                        ),
                      ),

                      SizedBox(height:20),

                      Container(
                        width: 380,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          controller: emailController,
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          width:380,
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (phone)
                            {
                              phoneController.text = phone.completeNumber;
                            },

                          ),
                        ),
                      ),

                      SizedBox(height:20),

                      Container(
                        width:150.0,
                        child: OutlinedButton(
                          onPressed: goTo, //toDo
                          child: Text('Next'),
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
