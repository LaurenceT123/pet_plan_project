import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../user_petProfiles_screens/petProfiles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Text(
              'Enter Vet Information',
              style: new TextStyle(
                fontSize: 35.0,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:8.0, right: 8, left: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text('Doctor Name', style: GoogleFonts.lato (textStyle: TextStyle(fontSize:15))),

                    Container(
                      width:380,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller:nameController,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0, top:8),
                      child: Column(
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

                    Center(
                      child: Container(
                        width:150.0,
                        child: OutlinedButton(
                          onPressed: goTo, //toDo
                          child: Text('Submit'),
                        ),

                      ),
                    ),
                  ]
              ),
            ),


          ],
        ),
      ),
    );


  }
}
