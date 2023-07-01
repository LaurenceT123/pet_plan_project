import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import '../main.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class GetVetInfo extends StatelessWidget
{
  User user;
  VetInfo vet = new VetInfo();

  GetVetInfo({super.key, required this.user});

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    goTo() {

      if(!nameController.text.isEmpty && !locationController.text.isEmpty && !phoneController.text.isEmpty) {

        vet.setDoctorName(nameController.text);
        vet.setLocation(locationController.text);
        vet.setPhoneNumber(phoneController.text);


        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyPetProfiles_screen(user: user, vet: vet)),);
      }
      else
      {
        print("Try again, all fields are required!");
      }

    }

    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

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
                            labelText: 'Doctor Name',
                          ),
                          controller:nameController,
                        ),
                      ),

                      SizedBox(height:20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address', style: GoogleFonts.lato (textStyle: TextStyle(fontSize:15))),

                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top:5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade700,
                                width:1.0,
                              ),
                            ),
                            child: TextField(
                              maxLines:null,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Address',
                              ),
                              controller: locationController,
                            ),
                          ),
                        ],
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
