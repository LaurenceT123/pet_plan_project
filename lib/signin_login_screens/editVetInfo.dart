import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../custom_made_widgets/profile_widget.dart';
import '../custom_made_widgets/input_field.dart';
import '../signin_login_screens/showVetInfo.dart';
import '../models/User.dart';
import '../models/VetInfo.dart';

class EditVetInfo extends StatelessWidget
{
  User user;
  VetInfo vet;

  EditVetInfo({super.key, required this.user, required this.vet});

  @override
  Widget build(BuildContext context)
  {

    final newDoctorNameController = new TextEditingController();
    final newLocationController = new TextEditingController();
    final newPhoneNumberController = new TextEditingController();


    goTo() {

      if(!newDoctorNameController.text.isEmpty)
      {
        vet.setDoctorName(newDoctorNameController.text);
      }

      if(!newLocationController.text.isEmpty)
      {
        vet.setLocation(newLocationController.text);
      }

      if(!newPhoneNumberController.text.isEmpty)
      {
        vet.setPhoneNumber(newPhoneNumberController.text);
      }

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ShowVetInfo(user: user, vet: vet)),);

    }

    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [

            Expanded(
              flex:40,
              child: ProfileWidget(
                imagePath:'https://cdn3.iconfinder.com/data/icons/male-user-icons-2/500/muser-dr-512.png',
                onClicked: () {},
              ),
            ),

            Expanded(
              flex: 60,
              child: SingleChildScrollView(
                child: Column(
                    children:
                    [

                      Padding(
                        padding: const EdgeInsets.only(left:15.0, right: 15.0,),
                        child: MyInputField(
                          title: 'Name',
                          hint: vet.getDoctorName(),
                          controller: newDoctorNameController,
                        ),
                      ),

                        Padding(
                          padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 8),
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
                                    hintText: vet.getLocation(),
                                  ),
                                  controller: newLocationController,
                                ),
                              ),
                            ],
                          ),
                        ),


                      Padding(
                        padding: const EdgeInsets.only(top:20.0, right: 15, left: 15),
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
                              newPhoneNumberController.text = phone.completeNumber;
                            },

                          ),
                        ),
                      ),

                      SizedBox(height:20),

                      Container(
                        width:150.0,
                        child: OutlinedButton(
                          onPressed: goTo,
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
